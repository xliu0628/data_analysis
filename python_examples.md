### Regression of temperature field to Nino-3.4 index
    # step 1: standardize nino34 index
    nino34_stded = np.empty(nino34.size)
    for ii in np.arange(0,nino34.size):
    nino34_stded[ii] = (nino34[ii] - np.mean(nino34))/np.std(nino34)

    #step 2: calculate the regression coefficient
    import scipy.stats as stats
    reg_T = np.empty(temp[0,:,:].shape,temp.dtype)

    for ilat in range(lats.size):
        for ilon in range(lons.size):
            reg = stats.linregress(nino34_stded,temp[:,ilat,ilon])
            reg_T[ilat,ilon] = reg.slope
            
### integration of u, v along the streamline 


### calculation of the streamfunction

### area-average on the lat-lon grid

### area-average over a non-irregular region
### water budget analysis package

### calculation of ocean heat transport using ocean data

### a
