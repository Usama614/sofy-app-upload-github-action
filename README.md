# Sofy-Application-Upload

This respository contains a library of GitHub Actions to help you upload your build at Sofy.

You are required to provide the Build Path and Subscription  key.

## Build Path

Makesure your build(.apk file or .ipa file) is created in the same remote repository. You are required to input the build path of your build. You can copy the path by opening your file at github repository, click on the three dots (...) and select copy path.

Note: Don't provide local path of your build, it should be the remote path of your build.

## Subscription Key

Find your subscription key by logging into Sofy, going to Account Settings --> API Key section.

## Usage

Add the following step action in your workflow. Makesure to add checkout action before sofy upload action as mentioned below. The purpose of using Checkout action is to checks-out your repository under $GITHUB_WORKSPACE, so your workflow can access it.

```yaml
- name: 'checkout'
  uses: 'actions/checkout@v2'
- name: 'Upload build'
  env:
    build_path: 'Path/to/your/build(.apk or .ipa)'
    subscription_key: Your subscription key
  uses: 'SOFYDEVELOPER/sofy-app-upload-github-action@main'

```

## Sample Workflow

Following is the sample workflow. Makesure to provide build path and subscription key as environment variable inputs in your workflow. Also add the checkout action before sofy upload action.

```yaml
jobs:  
  Uploading-job:  
    name: 'Upload build on Sofy'
    runs-on: ubuntu-latest
    steps:
      - name: 'MakeBuild'
         #...
         #... (generate .apk or .ipa)
         #...
      - name: 'checkout'
        uses: 'actions/checkout@v2'
      - name: 'Upload build'
        env:
          build_path: 'Path/to/your/build(.apk or .ipa)'
          subscription_key: Your subscription key
        uses: 'SOFYDEVELOPER/sofy-app-upload-github-action@main'
        
```
