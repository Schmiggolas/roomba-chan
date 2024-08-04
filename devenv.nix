{ pkgs, lib, config, inputs, ... }:

{
    packages = with pkgs; [
      godot_4
    ];

    processes = {
      godot.exec = "godot4 -e";
    };
}