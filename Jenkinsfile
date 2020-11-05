node {
    checkout scm
    env.MAVEN_SETTINGS_PATH = '/var/lib/jenkins/settings.xml'
    def mvnHome = tool name: 'Maven (latest)', type: 'hudson.tasks.Maven$MavenInstallation'
    def jdkHome = tool name: 'Java 8', type: 'hudson.model.JDK'
    stage("Create Tag") {
                       if(env.BRANCH_NAME == 'master'){
                           withEnv(["PATH=${jdkHome}/bin:${mvnHome}/bin:${env.PATH}", "M2_HOME=${mvnHome}"]) {
                               withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                                   configFileProvider([configFile(fileId: MVN_SETTINGS_CONFIG_FIELD, variable: 'MAVEN_SETTINGS')]) {

                                       sh "git config user.email ${GIT_COMMITER_EMAIL}"
                                       sh "git config user.name '${GIT_COMMITER_USERNAME}'"

                                       // Determine the version to be released

                                       def pomVersion = ''
                                       def minorVersion = ''
                                       def latestTag = ''
                                       def lastPatch = ''

                                       pomVersion = sh (
                                               script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout',
                                               returnStdout: true
                                       ).trim()

                                       echo 'Pom version ' + pomVersion
                                       lastPatch = pomVersion.substring(pomVersion.size()-pomVersion.reverse().indexOf('.'))
                                       minorVersion = pomVersion.substring(0, pomVersion.indexOf(lastPatch))

                                       echo 'Minor version ' + minorVersion
                                       sh "git remote set-url origin https://${env.GIT_USERNAME}:${env.GIT_PASSWORD}@github.com/mulesoft/${repoName}.git"
                                       sh "git fetch --all --tags"
                                       sh "git tag --sort=version:refname -l v${minorVersion}[0-9]* > tags.txt"

                                       latestTag = sh (
                                               script: 'tail -n1 tags.txt',
                                               returnStdout: true
                                       ).trim()

                                       echo 'Latest tag ' + latestTag
                                       releaseVersion = "${pomVersion}" as String
                                       newTagNameCandidate = "v${releaseVersion}" as String
                                       if(latestTag.equals(newTagNameCandidate)){
                                           sh "git push origin :refs/tags/${latestTag}"
                                           sh "git tag -fa ${latestTag} -m \"updated tag version ${latestTag}\""
                                           sh "git push origin ${latestTag}"
                                       }else {
                                           // Release version
                                           sh "${mvnHome}/bin/mvn -gs ${env.MAVEN_SETTINGS} clean install --non-recursive"
                                           sh "git checkout ."
                                           sh "${mvnHome}/bin/mvn -gs ${env.MAVEN_SETTINGS} clean install --non-recursive"

                                           echo "Checking out new tag ${newTagNameCandidate}"
                                           sh "git tag ${newTagNameCandidate} -m \"tag version ${newTagNameCandidate}\""
                                           sh "git push origin ${newTagNameCandidate}"

                                       }
                                   }
                               }
                           }
                       } else sh "echo Tag creation is only made for master branch"
            }
    }