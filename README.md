# Validate Git Branch Name

A simple bash script to validate local git branch name.

Copy validate-branch-name.sh bash script to project root and add the following to package.json

```bash
"validate-branch-name": "bash validate-branch-name.sh"
```

Combine with Husky to check branch names before committing or pushing to GitHub.

For example in '.husky/pre-push':

```bash
npm run validate-branch-name
npm audit --omit=dev
```

The default acceptable branch pattern is:

```bash
feat|fix|hotfix|release|core/your-branch-name
```

So 'feat/test-branch' will pass validation but 'test-branch' will fail.

RegEx can be modified to fit any standard branch naming practice that is being used.

Examples:

```
^(feature|patch|hotfix|release)/.+ - branch has to start with feature/, patch/, release/ or hotfix/

(feature|release|hotfix)/(JIRA-\d+) - it should look like feature/JIRA-1234

(feature|release|hotfix)/(JIRA-\d+/)?[a-z-]+ - it should look like feature/branch-name or include JIRA's code like feature/JIRA-1234/branch-name

```
