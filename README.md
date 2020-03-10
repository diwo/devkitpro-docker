# Devkitpro Docker Image

## Build image
```
docker build -t devkitpro .
```

## Example usage
Mount current directory and `make`:
```
docker run --rm -v `pwd`:/$(basename `pwd`) -w /$(basename `pwd`) devkitpro make
```
