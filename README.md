# Validate Git Branch Name

A simple bash script to validate local git branch name without the need to install packages or dependencies.

## Using

Copy validate-branch-name.sh bash script to project root and add the following to package.json

```bash
"validate-branch-name": "bash validate-branch-name.sh"
```

The script can be run from the command line with

```
npm run validate-branch-name
```

Combine with Husky to check branch names before committing or pushing to GitHub.

For example in '.husky/pre-push':

```bash
npm run validate-branch-name
npm audit --omit=dev
```

**Alternatively**, the validation script can be copied and pasted directly into the relevant husky hook script and executed directly.

The default acceptable branch pattern is:

```bash
feat|fix|hotfix|release|chore/your-branch-name
```

So **'feat/test-branch'** will pass validation but **'test-branch'** will fail.

Note that **'main'** and **'dev'** branch names bypass checks as they are 'standard' branch names.

## Customisation

The RegEx can be modified to fit any branch naming practice that is being used.

Replace default REGEX value with custom regex (some examples below).

Replace default STANDARD_BRANCHES value with names of standard branches names that avoid regex checks (E.g 'main|working')

```
REGEX='^(feat|fix|hotfix|release|chore)/.'
STANDARD_BRANCHES='main|dev'
```

Examples:

- branch name has to start with 'feature/', 'patch/', 'hotfix/' or 'release/' E.g 'hotfix/urgent'

```
REGEX='^(feat|patch|hotfix|release)/.+'
```

- branch name needs to be in the format 'feat/JIRA-1234'

```
REGEX='(feat|release|hotfix)/(JIRA-\d+)'
```

- branch name needs to be in the format 'feature/branch-name' OR include JIRA's code like 'feat/JIRA-1234/branch-name'

```
REGEX='(feat|release|hotfix)/(JIRA-\d+/)?[a-z-]+'
```

## Error Message

Change or update the error message if custom regex is used. E.g

```
ERROR_MESSAGE="branch name needs to be in the format 'feat/JIRA-1234'"
```
