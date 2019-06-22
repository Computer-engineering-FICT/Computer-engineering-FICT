@ECHO off
wmic cpu get caption
wmic cpu get L2CacheSize
wmic cpu get L3CacheSize

pause
