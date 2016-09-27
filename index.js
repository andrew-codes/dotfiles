const utils = require('./utils');
const path = require('path');

const prependPath = (dirPath) => (fileRefs) => fileRefs.map((fileRef) => path.join(dirPath, fileRef));

const symlinkFilesTo = (dest) => (fileRefs) => {
    fileRefs.forEach((fileRef) => {
        try {
            utils.mklink(fileRef, dest);
        }
        catch(error) {
            console.log('Error symlinking file', fileRef, error);
        }
    });
    return fileRefs;
};

const bashDirPath = path.resolve('bash');
const bashFiles = utils.readdir(bashDirPath)
    .then(prependPath(bashDirPath))

const gitDirPath = path.resolve('git');
const gitFiles = utils.readdir(gitDirPath)
    .then(prependPath(gitDirPath));


Promise.all([bashFiles, gitFiles])
    .then((listOfFileLists) => listOfFileLists.reduce((output, fileRef) => output.concat(fileRef), []))
    .then(symlinkFilesTo(utils.config.home));
