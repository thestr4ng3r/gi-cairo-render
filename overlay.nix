_: pkgs:
{
  haskellPackages = pkgs.haskellPackages.override (old: {
    overrides = pkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
      gi-cairo-render =
        self.callCabal2nix "gi-cairo-render" ./gi-cairo-render
        { inherit (pkgs) cairo; };
      gi-cairo-connector =
        self.callCabal2nix "gi-cairo-connector" ./gi-cairo-connector
        { };
      haskell-gi-base = self.callHackageDirect {
          pkg = "haskell-gi-base";
          ver = "0.22.2";
          sha256 = "0bdmhvq2bw5mf135wf94hdc3xidjzyr9y3bmvx30pgyv6hflldki";
        }
        { inherit (pkgs) glib; };
      haskell-gi =
        self.callHackageDirect {
          pkg = "haskell-gi";
          ver = "0.22.5";
          sha256 = "14fh9hc14mlxgw1snn9iachby6xaxwzzqp9migyyg9751b9ny86q";
        }
        {inherit (pkgs) glib gobject-introspection; };
    });
  });
}
