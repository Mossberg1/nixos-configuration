# NixOS configuration

## Rebuilding

```bash
sudo nixos-rebuild switch --flake .#   # apply now and on boot
sudo nixos-rebuild build --flake .#    # build only
sudo nixos-rebuild test --flake .#     # apply now, no boot entry
```

## Updating

```bash
nix flake update                       # refresh flake.lock, then rebuild
```
