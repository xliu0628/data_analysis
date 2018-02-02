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

## Get transient eddies
## get u'* and v'*
cdo -b 32 sub monthly/u_monthly.nc -enlarge,era_grid.txt -timmean -zonmean monthly/u_monthly.nc u_prime_star.nc
cdo -b 32 sub monthly/v_monthly.nc  -enlarge,era_grid.txt -timmean -zonmean monthly/v_monthly.nc v_prime_star.nc
## get u'*v'*
cdo mul u_prime_star.nc v_prime_star.nc uv_prime_star.nc

## get the time mean and zonal mean
#cdo timmean -zonmean uv_prime_star.nc eddy_mom.transient.nc

cdo -zonmean uv_prime_star.nc mom.transient.eddy.nc
rm -f u_prime_star.nc
rm -f v_prime_star.nc
rm -f uv_prime_star.nc
