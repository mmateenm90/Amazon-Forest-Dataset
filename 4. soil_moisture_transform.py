from osgeo import gdal
gdal.AllRegister()

for year in range(2001,2021):
    print(year)
    print('----')
    
    for month in range(1,13):
        print(month)
        
        in_path = os.path.join('D:\\', 'Forest_Fire_Work', '02. Data&Working', '07. Soil Moisture', 'a. downloaded_yearly_monthwise', str(year), 'r.' + str(year) + str(month) + '.tif')
        rast_src = gdal.OpenShared(in_path,gdal.GA_Update)

        gt = rast_src.GetGeoTransform()
        gtl = list(gt)

        gtl[0] = -360.5

        rast_src.SetGeoTransform(tuple(gtl))

        rast_src = None
        
    print('===')
