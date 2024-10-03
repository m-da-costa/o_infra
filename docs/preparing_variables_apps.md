# Set values for deployment of apps

1) Set the ip range for metalLB in the [file](../kubernetes/1-configure_cluster/0-helm_config/mlb.yaml)
2) Create a file called `token` in the folder:
```
kubernetes/1-configure_cluster/2-certmanager/scripts/
```
With the token for CloudFlare
3) For longhorn and rancher change the configuration files:
`values.yaml` and `ingress.yaml` in the rancher folder and `values.yaml` in the longhorn folder.
4) For the each app change the following files with your configuration:
- BaseRow:
Change the `complete.yaml`
- ChatWoot:
Change `values.yaml`
- Evolution API
Change `complete.yaml`
- N8N
Change `values.yaml`

5) For AI inference:
- Ollama:
Change `complete.yaml`

