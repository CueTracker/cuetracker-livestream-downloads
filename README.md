# CueTracker LiveStream

Official Windows and Linux downloads and a local Docker image. Camera video, screenshots and model training stay on your own computer or server.

- [Downloads](https://github.com/kenno7/cuetracker-livestream-downloads/releases)
- [Quick Start Guide](https://livestream.cuetracker.app/guide.html)
- [Linux and Docker instructions](https://livestream.cuetracker.app/self-host.html)
- [Microsoft Store](https://apps.microsoft.com/detail/9N4NQ5HN0PKX) — v2.9 is submitted for certification; availability depends on Microsoft approval. The v3 Windows ZIP remains unsigned.

## Docker on Linux (AMD64 / x86_64)

```sh
docker volume create cuetracker-data
docker run -d --name cuetracker-livestream \
  --restart unless-stopped --network host \
  -v cuetracker-data:/data \
  ghcr.io/kenno7/cuetracker-livestream:3.0.0
```

Open http://127.0.0.1:8765 on the host. For a headless host, forward the dashboard with `ssh -L 8765:127.0.0.1:8765 USER@HOST`, then open that address on your computer. The dashboard provides a private phone/LAN link. Keep the link private, and do not forward ports to the internet. Each camera's local viewer has its own port; all cameras share one dashboard.

Alternatively, download this repository's `compose.yaml` and run `docker compose up -d`. Keep the `cuetracker-data` volume when updating. Use SAVE BACKUP before updates.

## Linux portable app (x86_64, Ubuntu 22.04+ compatible)

```sh
mkdir -p ~/Apps/CueTracker
cd ~/Apps/CueTracker
curl -fLO https://github.com/kenno7/cuetracker-livestream-downloads/releases/download/v3.0.0/CueTrackerCameraStudio-Linux-x86_64.tar.gz
curl -fLO https://github.com/kenno7/cuetracker-livestream-downloads/releases/download/v3.0.0/CueTrackerCameraStudio-Linux-x86_64.tar.gz.asc
curl -fLO https://github.com/kenno7/cuetracker-livestream-downloads/releases/download/v3.0.0/cuetracker-release-signing.asc
gpg --import cuetracker-release-signing.asc
gpg --verify CueTrackerCameraStudio-Linux-x86_64.tar.gz.asc CueTrackerCameraStudio-Linux-x86_64.tar.gz
```

Verify a good signature with fingerprint **A7382368221F944CB6A247C04E21DF504C446489** before extracting:

```sh
tar -xzf CueTrackerCameraStudio-Linux-x86_64.tar.gz
./CueTrackerCameraStudio/CueTrackerCameraStudio
```

This is CueTracker's GitHub distribution repository, not an Ubuntu/Debian package repository. No root installer or system-wide security changes are required.

## Local models and backups

Each camera keeps separate red/yellow and numbered-ball models. Numbered models can distinguish individual numbers for Kelly Pool, or group solids and stripes. Train from labelled camera screenshots and test fresh arrangements; no pretrained model for your camera is claimed.

SAVE BACKUP includes every managed camera, connection, model version, screenshot, label, calibration and saved setup in an encrypted `.ctbackup`. Keep the password safe. RESTORE BACKUP adds new workspaces without overwriting existing cameras.

Closing your browser leaves the app running. Stop app or the tray Quit action stops managed cameras. Start the app again to restore its saved camera sessions.
