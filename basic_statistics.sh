## get the zonal mean
cdo zonmean ifile.nc ofile.nc ## the resulted longitude dimension is of size 1. 
ncwa -a lon ifile.nc ofile.nc ## the longitude dimension will be removed
