{...}: {
  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        extraDefCfg = "process-unmapped-keys yes concurrent-tap-hold true";

        config = ''
          (defsrc
            lsft
            lmet
            f23
          )
          (deflayer default lsft lmet f23)
          (defchordsv2
            (lsft lmet f23) rctl 10 all-released ()
          )
          (defoverrides
            (caps) (esc)
            (lctl esc) (caps)
          )
        '';
      };
    };
  };
}
