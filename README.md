# Open Infra (o_infra)

## Objetive

Be a repo that agregate documents and types of deployments for multiple public clouds and bare metal hosting.

## How to run:
First activate the environment:
```bash
poetry shell
```
Install all dependencies:
```bash
poetry install
```

Now only the Proxmox k0s routine was tested.

For proxmox follow the steps:

Prepare Proxmox

[Preparing Proxmox](docs/preparing_proxmox.md)

Prepare variables (terraform + ansible):

[Preparing to Deploy k0s](docs/preparing_variables_for_k0s.md)

Prepare to deploy apps:

[Preparing apps](docs/preparing_variables_apps.md)

After that run:


```bash
sh kubernetes/create_all
```

---
# This repo is very much beta.

## Road Map

- [ ] Curses TUI <- nice
- [ ] Add automation for creating ssh keys
- [ ] Reescrever rotinas em puro Ansible
- [ ] Convert to a type of jinja templating?
- [x] Add GKE terraform routine
- [ ] Add EKS terraform routine
- [ ] Add Alibaba terraform routine
- [ ] k3s routine
- [ ] k8s routine for self-hosting
- [ ] Nix as hypervisor instead of proxmox
