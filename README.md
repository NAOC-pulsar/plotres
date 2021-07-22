# readme
Forked from vivekvenkris/plotres

```bash
git clone https://github.com/NAOC-pulsar/plotres.git
cd plotres
make
# then the plotres and plotres_ps will be created in the ~/.local/bin/
# check the executable program
ls ~/.local/bin/plotres
ls ~/.local/bin/plotres_ps
```

# 注意
假如发现抛出报错如下:
```
 ==========  PLOT RESIDUALS  ==========

 Nb. of TOAs:        473
At line 416 of file plotres.f
Fortran runtime error: Bad value during floating point read
```
请检查`tempo.lis`文件中开头为PSR的行是否是如下的格式。

`PSR J0024-7205AA  Ephem.: DE421  Clock: UTC(NIST)     Ref. MJD:   51600.0000`

目前的解决方案之一为在par文件中不需要加入POSEPOCH选项。然后再次使用tempo进行拟合，并绘图

# plotres
plotres is an interactive GUI for analysing TEMPO residuals. 

The software is written by Prof. Norbert Wex (wex@mpifr-bonn.mpg.de) and Prof. Michael Kramer (mkramer@mpifr-bonn.mpg.de). I have not contributed to the development of this software. This repository is created just to pull it inside my docker container. 

# Requirements:
```
gfortran
pgplot
X11
```
# Compilation:
```
gfortran -o ~/bin/plotres plotres.f -lcpgplot -lpgplot -lX11 -lm
gfortran -o ~/bin/plotres_ps plotres_ps.f -lcpgplot -lpgplot -lX11 -lm 
```

# Usage:

1. Run `tempo` with your `.tim` and `.par` files which will create a `resid2.tmp` file
2. run `./plotres` in the same directory with no other arguments. 
