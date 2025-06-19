# kali-docker-profiles

This repository contains multiple Kali Linux Docker profile configurations tailored for specific use cases: **Web**, **Forensics**, and **Network**. Each profile spins up a fully-featured Kali container accessible through a secure browser-based noVNC interface.

> ⚠️ **WARNING:** Default passwords are defined in `.env` files and are **NOT** secure. **Change all credentials before deploying to production environments.**

---

## 🧱 Repository Structure

- `Dockerfile.profile`: Profile-specific image that builds on the base image from [`kali-docker`](https://github.com/your-username/kali-docker).
- `env/`: Contains `.env` files for each Kali profile:
  - `web.env`
  - `forensics.env`
  - `network.env`
- `docker-compose.yml`: Launches each Kali profile container with required environment variables and reverse proxy integration.

---

## 🔗 Dependencies

- A shared Docker proxy server (`nginx-proxy` and `letsencrypt-nginx-proxy-companion`) is required to expose each Kali container via subdomain and HTTPS.
  - Make sure the `proxy` network exists:
    ```bash
    docker network create proxy
    ```

- You must have the base Kali image from [`sworthlabs/kali-base`](https://hub.docker.com/r/sworthlabs/kali-base) already pulled or built locally.

---

## 🚀 Deployment

To launch any Kali profile, use the following pattern:


```bash
docker compose --env-file env/<profile>.env --project-name <project-name> up -d

```

## Examples

```bash
docker compose --env-file env/web.env --project-name kali-web up -d
docker compose --env-file env/forensics.env --project-name kali-forensics up -d
docker compose --env-file env/network.env --project-name kali-net up -d
```


##Accesing

Each container is accesible at https://[[container-name]].[[host-name]]
```bash
https://kali-web.sworthlabs.com
```

