# CueTracker LiveStream

Official Windows and Linux downloads and a local Docker image. Camera video, screenshots and model training stay on your own computer or server.

The source repository is private. Public releases contain the compiled Windows and Linux applications; the Docker image is assembled from the same signed compiled Linux application and does not contain the raw CueTracker Python source or test suite.

- [Downloads](https://github.com/CueTracker/cuetracker-livestream-downloads/releases)
- [Quick Start Guide](https://livestream.cuetracker.app/guide.html)
- [Linux and Docker instructions](https://livestream.cuetracker.app/self-host.html)
- [Microsoft Store](https://apps.microsoft.com/detail/9N4NQ5HN0PKX) — available now. The portable Windows ZIP remains unsigned.

## Docker on Linux (AMD64 / x86_64)

```sh
docker volume create cuetracker-data
docker run -d --name cuetracker-livestream \
  --restart unless-stopped --network host \
  -v cuetracker-data:/data \
  ghcr.io/cuetracker/livestream:3.9.0
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

Each camera keeps separate Reds, Yellows, Black + White and Numbered Set models. Numbered models distinguish individual numbers 1–15 for Kelly Pool. Train from labelled camera screenshots and test fresh arrangements; no pretrained model for your camera is claimed.

SAVE BACKUP includes every managed camera, connection, model version, screenshot, label, calibration and saved setup in an encrypted `.ctbackup`. Keep the password safe. RESTORE BACKUP adds new workspaces without overwriting existing cameras.

Closing your browser leaves the app running. Stop app or the tray Quit action stops managed cameras. Start the app again to restore its saved camera sessions.

## Android phone camera test

The [CueTracker Phone Camera test APK](https://github.com/CueTracker/cuetracker-livestream-downloads/releases/download/phone-camera-test-v0.1/CueTrackerPhoneCamera-test-v0.1.apk) turns an Android phone on the same Wi-Fi into a local camera feed. It is a debug-signed test build, not a Play Store release. Open it on the phone, grant Camera access, tap **Start phone camera**, then select **Android phone with CueTracker Phone Camera** in the LiveStream desktop app. No Android Studio is needed to test the APK.
