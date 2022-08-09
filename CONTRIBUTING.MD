# Welcome to `cmd` contributing guide 👋🏻

[![Flutter Package](https://img.shields.io/badge/Pub-cmd-blue?logo=dart&logoColor=white)](https://github.com/UsamaSarwar/cmd/blob/main/flutter/CONTRIBUTING.MD)

Read our [Code of Conduct](./CODE_OF_CONDUCT.MD) to keep our community approachable and respectable.

## Directory Structure Guide
_The scripts are categorized by framework wise. So, developers from other stack may find useful scripts easily._

```bash
├── cmd
│   ├── [framework]
│   │   ├── cmd
│   │   │   └── [script.sh]
```
For example, we have a sample script for ```flutter doctor``` command that's used to inspect Flutter Framework Environment.
```bash
├── cmd
│   ├── flutter
│   │   ├── cmd
│   │   │   └── doctor.sh
```

## Script File Guide
- [x] Make sure you add descriptions in comments followed by `#` or `##` above each script or in the start of Batch Scripts.
- [x] Add `#!/bin/sh` the in the beginning of script.

```bash
#!/bin/sh

##? Inspecting the current state of the Flutter environment
flutter doctor -v

##? Checking for the latest version of Flutter
# flutter upgrade

##? Checking for the latest version of Flutter with force update
# flutter upgrade --force
```