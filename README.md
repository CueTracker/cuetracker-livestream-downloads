# CueTracker LiveStream

Official Windows and Linux downloads and a local Docker image. Camera video, captured frames and model training stay on your own computer or server.

The source repository is private. Public releases contain the compiled Windows and Linux applications; the Docker image is assembled from the same signed compiled Linux application and does not contain the raw CueTracker Python source or test suite.

- [Downloads](https://github.com/CueTracker/cuetracker-livestream-downloads/releases)
- [Quick Start Guide](https://livestream.cuetracker.app/guide.html)
- [Linux and Docker instructions](https://livestream.cuetracker.app/self-host.html)
- [Microsoft Store](https://apps.microsoft.com/detail/9N4NQ5HN0PKX) — install and update through Microsoft Store.
- [Windows installer](https://livestream.cuetracker.app/downloads/CueTrackerLiveStream-Windows-Setup.exe) — installs shortcuts and updates the app while keeping saved data.

## Docker on Linux (AMD64 / x86_64)

```sh
docker volume create cuetracker-data
docker run -d --name cuetracker-livestream \
  --restart unless-stopped --network host \
  -v cuetracker-data:/data \
  ghcr.io/cuetracker/livestream:3.29.0
```

Open http://127.0.0.1:8765 on the host. For a headless host, forward the dashboard with `ssh -L 8765:127.0.0.1:8765 USER@HOST`, then open that address on your computer. The dashboard provides a private phone/LAN link. Keep the link private, and do not forward ports to the internet. Each camera's local viewer has its own port; all cameras share one dashboard.

Alternatively, download this repository's `compose.yaml` and run `docker compose up -d`. Keep the `cuetracker-data` volume when updating. Use SAVE BACKUP before updates.

## Linux portable app (x86_64, Ubuntu 22.04+ compatible)

```sh
curl -fL https://livestream.cuetracker.app/install-linux.sh -o cuetracker-install.sh
sh cuetracker-install.sh
```

The installer verifies CueTracker's release signature before extracting the app and adds a desktop shortcut. Run the same commands to update after choosing **Stop app**. Saved cameras and models stay in the separate data folder.

This is CueTracker's GitHub distribution repository, not an Ubuntu/Debian package repository. No administrator access is required. [Manual verification and uninstall details](https://livestream.cuetracker.app/self-host.html).

## Local models and backups

Each camera keeps separate Reds, Yellows, Black + White and Numbered Set models. Numbered models distinguish individual numbers 1–15 for Kelly Pool. Train from labelled camera frames and test fresh arrangements. Select **Improve this saved model** to add examples and retrain an existing model.

Open the header **Settings** cog for SAVE BACKUP, RESTORE BACKUP, broadcasting, app updates and Stop. The camera dropdown switches workspaces or adds another camera. SAVE BACKUP includes every managed camera, connection, model version, captured frame, label, calibration and saved setup in an encrypted `.ctbackup`. Keep the password safe. RESTORE BACKUP adds new workspaces without overwriting existing cameras.

Closing your browser leaves the app running. Stop app or the tray Quit action stops managed cameras. Start the app again to restore its saved camera sessions.

## Android phone camera companion

The [CueTracker Phone Stream v0.12 APK](https://github.com/CueTracker/cuetracker-livestream-downloads/releases/download/phone-stream-v0.12/CueTrackerPhoneStream-v0.12.apk) turns an Android phone on the same network into a camera source for LiveStream. It is a separate companion, not the desktop setup or broadcasting app. Open it on the phone, grant Camera access, choose a camera and picture quality, then tap **START PHONE CAMERA** and find the phone in LiveStream. Android Studio is not required. See the [phone setup guide](https://livestream.cuetracker.app/phone-setup.html).

## Current desktop release

Version 3.29 improves numbered-ball overlays, crop-size tolerance and still-frame label stability. It supports data-only imports of the original numbered classifier while keeping each user's weights and training images local. Windows updates and uninstall now close remaining processes from that installation without affecting other copies. Saved cameras and models are preserved.

Broadcasting starts only when you press Start. Shared provider sign-in depends on provider approval; supported stream-key broadcasting remains available. Microsoft Store packages are released separately. Previous downloads remain available.
