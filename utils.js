const childProcess = require('child_process');
const spawn = childProcess.spawn;
const exec = childProcess.exec;
const fs = require('fs');
const path = require('path');
const process = require('process');

const platform = process.platform.replace(/(32|64)/, '');
const config = {
	platform,
	isOsx: platform === 'darwin',
	isWindows: platform === 'win',
	home: process.env.HOME || process.env.USERPROFILE,
	unsupportedPlatformError: `Platform not supported: ${process.platform}`
};
module.exports.config = config;

module.exports.mklink = (src, dest) => {
	// try {
	// 	fs.unlinkSync(dest);
	// } catch (error) {
	// 	console.error(error);
	// }
    const srcPath = path.resolve(src);
    const destPath = path.resolve(dest);
	if (config.isOsx) {
		command = `ln -sfn ${src} ${dest}`;
	} else if (config.isWindows) {
		command = `mklink "${dest}" "${src}"`;
	} else {
        throw new Error(config.unsupportedPlatformError);
    }
	return shell(command);
}

module.exports.readdir = (directoryPath) => {
	return new Promise(function (resolve, reject) {
		directoryPath = path.resolve(directoryPath);
		fs.readdir(directoryPath, (error, output) => {
			if (error) {
				reject(error);
				return;
			}
			resolve(output);
		});
	});
}
module.exports.shell = shell;

function shell(command) {
	if (config.isWindows){
		return powershell(command);
	}
	return bash(command);
}

function bash(command) {
	console.log('bash', command);
	return new Promise((resolve, reject) => {
		exec(command, (error, stdout, stderr)=> {
			if (error) {
				reject(error);
				return;
			}
			resolve(true);
		})
	});
}

function powershell(command) {
	console.log('powershell.exe', command);
	return new Promise((resolve, reject)=> {
		var cmdProcess = spawn('powershell.exe', ['-NoProfile', '-ExecutionPolicy', 'Bypass', command]);
		cmdProcess.stdout.on('data', (data)=> {
			console.log(data.toString());
		});
		cmdProcess.stderr.on('data', (data)=> {
			reject(data.toString());
		});
		cmdProcess.on('exit', ()=> {
			resolve(true);
		});
		cmdProcess.stdin.end();
	});
}
