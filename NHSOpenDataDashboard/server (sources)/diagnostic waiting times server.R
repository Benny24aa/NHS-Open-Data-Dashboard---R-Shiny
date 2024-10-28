##### added map

output$Diagnostics_Map <- renderLeaflet({
  leaflet(HBSHP_File) %>% 
    setView(lng = 4.0532, lat = 56.4396, zoom = 3)%>% 
    addProviderTiles('Esri.WorldImagery') %>% 
    addPolygons(color = "black") %>% 
  addTiles()
})