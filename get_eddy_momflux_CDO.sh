#! /bin/sh
## get the expname from the AM2.1 output folder
cd ..
folder=${PWD##*/}
echo $folder
fname=${folder} 
#fname=${folder#*_}  # remove prefix ending in "-"
echo $fname
cd history
echo "${PWD##*/}"

## Equation (u-[u])*(v-[v])
#echo "Input: ucomp"
rm -f grid.txt
cdo griddes u.nc >grid.txt
cdo -b 32 sub u.nc -enlarge,grid.txt -zonmean u.nc u_star.nc
cdo -b 32 sub v.nc -enlarge,grid.txt -zonmean v.nc v_star.nc
cdo mul u_star.nc v_star.nc uv_star.nc
cdo timmean -zonmean uv_star.nc ${fname}.eddy_mom.nc
