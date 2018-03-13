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
