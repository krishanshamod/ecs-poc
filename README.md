## Run application

```bash
npm install
node index.js
```

## Versioning

This project follows semantic versioning (SemVer) principles for version numbering.

### Automatic Patch Versioning

The pipeline is configured to automatically increment the patch version for every new change pushed to the main branch. This is useful for regular updates and bug fixes. You don't need to manually create tags for these changes.

### Manual Major/Minor Versioning

If you need to update the major or minor version, you will need to manually create a tag and push it along with your commit. Follow these steps:

1. Create the new version tag using the following command:

   ```bash
   git tag v1.0.0
   ```

2. Push the tag to the remote repository using the following command:

   ```bash
   git push origin v1.0.0
   ```

3. Push the latest commits to the remote repository.
