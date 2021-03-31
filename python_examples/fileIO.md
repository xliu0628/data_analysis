### selecting dates with Panda
    filenamein = 'sst.mnmean.nc'
    FileIn = xarray.open_dataset(Datapath + filenamein,decode_times=True))
    lons = FileIn['lon'].values
    lats = FileIn['lat'].values
    time = FileIn['time']
    qnet = FileIn['sst']
    #%%
    nino_mon = ['1987-08-01','1987-09-01','1991-12-01','1992-01-01','1992-02-01',
                '1997-07-01','1997-08-01','1997-09-01','1997-10-01','1997-11-01',
                '1997-12-01','1998-01-01','1998-02-01','2002-11-01','2009-11-01',
                '2009-12-01']
    nina_mon = ['1988-06-01','1988-07-01','1988-10-01','1988-11-01','1988-12-01',
                '1989-01-01','1998-12-01','1999-01-01','1999-02-01','1999-12-01',
                '2000-01-01','2000-02-01','2007-12-01','2008-01-01','2008-02-01']
    nino_mon = pd.to_datetime(nino_mon)
    nina_mon = pd.to_datetime(nina_mon)

    qnet_nino = qnet.sel(time=nino_mon)
    qnet_nina = qnet.sel(time=nina_mon)
    
    
### read, edit, and then save a netcdf file
    FileIn = xarray.open_dataset(path + filenamein,decode_times=False)
    lu_index = FileIn['LU_INDEX']
    luindex_new = xarray.where(lu_index<=5,12,lu_index)  # use xarray.where() rather than np.where()
    
    import netCDF4
    import h5py

    from shutil import copyfile
    copyfile('geo_em.d01.nc', 'bb.nc'). 

    dset = netCDF4.Dataset('bb.nc', 'r+') ## 'r+' is different from 'w'
    dset['LU_INDEX'][:] = luindex_new   ## note the format: dset['var'][:] = var_new !!!!
    dset.close() # have to close the file before being able to open it without error again. 

### read, edit, and save a netcdf file with xarray (to be edited)
    import xarray as xr
    ds = xr.load_dataset('geo_em.d01.nc')
    ds2 = ds
    editedVariable = xr.DataArray(~see documentation for what to put here)
    ds2.T = editedVariable
    ds2.to_netcdf('new_file_name.nc')

    http://xarray.pydata.org/en/stable/generated/xarray.Dataset.to_netcdf.html

    import xarray as xr
    ds=xr.open_dataset('test.nc')
    ds['var']=xr.where((ds['var']<0),-1,ds['var'])
    ds.to_netcdf('modified_test.nc') # rewrite to netcdf
