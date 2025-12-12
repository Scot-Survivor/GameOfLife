{
  pkgs ? import <unstable> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    cmake
    ninja
    xorg.libX11
    libGL
    clang-tools
    xorg.libXext
    glfw
    glew
    libxcb
    pkg-config
  ] ++ lib.mapAttrsToList (attr: value: if (lib.hasPrefix "lib" attr && attr != "libAppleWM") then value else null) xorg;
shellHook = ''
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.xorg.libXext}/lib:${pkgs.xorg.libX11}/lib
  '';
}
