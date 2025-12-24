this is cludzenia assignment demo

in the /github/workflow this is production grade yaml file which on evry new commit from git to github build new docker image by github actions and pushes this new image into ECR and from ECR it updates task defintion then update service to use this new task defintion and build tasks and deploys them fully automatically.

tasdef.json this is the file which  contains task defintion in json format which will be used by github actions to launch new task on every new commit 
