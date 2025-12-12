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
  ];
}
