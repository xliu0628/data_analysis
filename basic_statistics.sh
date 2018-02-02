## get the zonal mean
cdo zonmean ifile.nc ofile.nc ## the resulted longitude dimension is of size 1. 
ncwa -a lon ifile.nc ofile.nc ## the longitude dimension will be removed

## get the DJF mean
cdo yearmean -selmon,10,11,12 -shifttime,-2mo  prec.zon.nc prec.DJF.zon.nc

## remove the seasonal cycle
cdo ymonsub mom.eddy.nc -ymonmean mom.eddy.nc mom.eddy.anom.nc

## calculate global average
ncwa -w area -a lat,lon in.nc out.nc
# (Also, refer to https://www.unidata.ucar.edu/software/netcdf/workshops/2008/utilities/Nco.html)
#Method 2: 
ncap -h -O -s "weights=cos(lat*3.1415/180)" in.nc in.nc
ncwa -h -O -w weights -a lat,lon in.nc global_mean.nc

## calculate area average; not sure this is weighted. http://research.jisao.washington.edu/data_sets/nco/#example12
#Calculate your own "nino3.4" SST index!
ncwa -O -a lat,lon -d lat,-5.0,5.0 -d lon,190.0,240.0 in.nc nino34.nc

## calculate the regression using CDO, eg. temp field to nino34 index.
#step1: use the enlarge operator to enlarge the 1D time series to the size of the data file to be compared or to compute the trend.
#note: only the lat,lon can be expanded
#step2: calclulate the trend of these two datasets
cdo -C -enlarge,grid.ERAinterim.txt nino34.1979-2012.downloaded.nc nino.latlon.nc
cdo -trend nino.latlon.nc temp.nc reg.nc
