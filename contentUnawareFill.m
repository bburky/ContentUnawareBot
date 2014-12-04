#!/usr/local/bin/MathematicaScript -script

If[Length[$ScriptCommandLine] != 3,
 Print["Usage: contentUnawareFill.m http://example.com/example.jpg out.png"];
 Exit[]]

contentUnawareFill[img_] := 
 Inpaint[img, 
  Image@Dilation[DeleteBorderComponents@ImageForestingComponents[img],
     DiskMatrix[3]]]

url = $ScriptCommandLine[[2]];
img = Import[url];
Export[$ScriptCommandLine[[3]], contentUnawareFill[img], "PNG"];
