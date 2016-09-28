const utils = require('./../utils');
const path = require('path');
const fs = require('fs');

const includePath = (dirPath) => (fileRefs) => fileRefs.map((fileRef) => ({
        fileRef: fileRef,
        fullPath: path.join(dirPath, fileRef)
    })
);

const symlinkFilesTo = (dest) => (fileRefs) => {
    fileRefs.forEach((ref) => {
        try {
            fs.unlinkSync(path.join(dest, ref.fileRef));
        }
        catch(error) {
            console.log('Error deleting existing file', error);
        }
    });
    fileRefs.forEach((ref) => {
        try {
            utils.mklink(ref.fullPath, path.join(dest, ref.fileRef));
        }
        catch(error) {
            console.log('Error symlinking file', ref.fullPath, error);
        }
    });
    return fileRefs;
};

const bashDirPath = path.resolve('bash');
const bashFiles = utils.readdir(bashDirPath)
    .then(includePath(bashDirPath))

const gitDirPath = path.resolve('git');
const gitFiles = utils.readdir(gitDirPath)
    .then(includePath(gitDirPath));


Promise.all([bashFiles, gitFiles])
    .then((listOfFileLists) => listOfFileLists.reduce((output, fileRef) => output.concat(fileRef), []))
    .then(symlinkFilesTo(utils.config.home));
