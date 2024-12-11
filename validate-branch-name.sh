## Validate branch name format
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
REGEX='^(feat|fix|hotfix|release|chore)/.'
STANDARD_BRANCHES='main|dev'

if ! [[ $BRANCH_NAME =~ ^($STANDARD_BRANCHES){1}$|$REGEX+$ ]]; then
  echo "Error: INVALID BRANCH NAME '$BRANCH_NAME': rename using format 'feat|fix|hotfix|release|chore/your-branch-name'"
  exit 1
fi
echo "Validated branch: $BRANCH_NAME - all OK :)"


## Replace REGEX with any regex pattern you want here such as :
## ^(feature|fix|hotfix|release)/.+ - branch name has to start with 'feature/','fix/', 'release/' or 'hotfix/''
## (feature|release|hotfix)/(JIRA-\d+) - branch name should contain a JIRA code e.g 'feature/JIRA-1234'
## (feature|release|hotfix)/(JIRA-\d+/)?[a-z-]+ - branch name should be in the format 'feature/branch-name' or also include JIRA's code like 'feature/JIRA-1234/branch-name'