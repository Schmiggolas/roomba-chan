{ pkgs, lib, config, inputs, ... }:

{
    packages = with pkgs; [
      godot_4
      blender
    ];

    processes = {
      godot.exec = "godot4 -e";
    };
}