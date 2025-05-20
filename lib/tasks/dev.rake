desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

    if Rails.env.development?
    User.destroy_all
    end

    names.each do |name|
      user = User.new
      user.email    = "#{name.downcase}@example.com"
      user.password = "password"
      user.save
    end

  p "Added #{User.count} Users"

  # ——— Seed Restaurants ———
  restaurant_names = ["A", "Monteverde", "Oakville"]
  wine_menus       = [
    "sample_wines_1", 
    
    "**Sparkling** GLERA FRIZZANTE BISSON VENETO 2024 18 | 72, FRANCIACORTA CA’ DEL BOSCO ‘CUVÉE PRESTIGE 47TH EDIZIONE’ EXTRA BRUT LOMBARDY NV 25 | 100, TRENTODOC FERRARI ‘PERLÈ’ BRUT 2017 115, CHAMPAGNE GEOFFROY ‘EXPRESSION’ PREMIER CRU BRUT NV 165, CHAMPAGNE BÉRÊCHE & FILS BRUT RÉSERVE NV 230, BRUT ROSÉ EMANUELE SCAMMACCA DEL MURGO SICILY 2020 24 | 96, LAMBRUSCO ALBERICI AMILCARE ‘LA FOGARINA’ REGGIO-EMILIA 2021 60, LAMBRUSCO MEDICI ERMETE ‘CONCERTO’ REGGIO-EMILIA 2023 18 | 72, MOSCATO LA CALIERA ‘BORGO MARAGLIANO’ ASTI PIEDMONT 2023 16 | 64  
    **Rosé** NEBBIOLO ROSÉ MAMETE PREVOSTINI ‘MONROSE’ VALTELLINA LOMBARDY 2023 16 | 64, PINOT NOIR SINSKEY ‘VIN GRIS’ CARNEROS CA 2023 105, GRENACHE/CINSAULT/TIBOUREN THE LANGUAGE OF YES ‘LES FRUITS ROUGES’ CENTRAL COAST CA 2023 65, CILIEGIOLO BISSON LIGURIA 2021 72  
    **Orange** REBULA MOVIA GORIŠKA BRDA SLOVENIA 2020 105, MANZONI BIANCO FORADORI ‘FONTANA SANTA’ TRENTINO-ALTO ADIGE 2022 90, ORANGE BLEND ŠKERK ‘OGRADE’ FRIULI-VENEZIA GIULIA 2020 140, TREBBIANO SPOLETINO FONGOLI ‘BIANCOFONGOLI’ UMBRIA 2022 68, TREBBIANO SPOLETINO PAOLO BEA ‘ARBOREUS’ UMBRIA 2015 175, CHARDONNAY/FRIULANO BLEND RADIKON ‘SLATNIK’ FRIULI-VENEZIA GIULIA 2021 120
", 
    
    "**Sparkling:**
Ashes & Diamonds Crémant 200, Cruse Tradition 130, Maître de Chai Wilson 95, Maître de Chai Michael Mara 150, Paula Kornell 64, Racines Grand Reserve 210, Roederer Brut 80/90, Scharffenberger 70, Scotto 50, Carboniste Albariño 90, Cruse Valdiguie 110, Poe BdB 125, Schramsberg BdB 120, Schramsberg BdN 135, J. Schram 350, J. Schram L.D. 500, Stolpman Combe 120, Ultramarine Keefer 550, Cruse Rosé 95, Goldeneye 85, Louis Pommery 75, Mirabelle 88, Piper Sonoma 65, Poe Meunier 120, Caraccioli 190, Ultramarine Heintz 525
**Riesling / Chenin Blanc / Viognier:**
Bannister 75/95, Chateau Montelena 105, Smith-Madrone 100, Tatomer Steinhügel 60, Tatomer Vandenberg 90, Trefethen 75, Aperture 65, Dashe 70, Desire Lines 100, Lieu Dit 65/90, Pax Mahle 130, Cline 50, Cochon 85, Le Mistral 100, Peay 165, Pride Mountain 150
**Other Whites & White Blends:**
Aeris Carricante 95, Andis Sémillon 56, Bannister Ribolla 90, Irene Marsanne 85, Kongsgaard Albariño 160, Lieu Dit Melon 90, Matthiasson Vermentino 95, Newfound Sémillon 95, Ridge Grenache Blanc 105, Sand Point Pinot Grigio 50/56, Stolpman Roussane 84, Fogarty Gewürz 56, Anthill Farms 80, Bonny Doon 60, Clos Saron 115, Denner 145, Epoch 125, Folk Machine 50/55, Glories No. 5 475, Jumbo Time 65, Massican 80, McPrice Myers 105, Newfound Gravels 65, Sinskey Abraxas 105, Sans Liege 60/64, Sine Qua Non 485, Stolpman Uni 100, Villa Creek White 75
**Sauvignon Blanc:**
Accendo 205, Arietta 210, Arkenstone 220, Bevan 150, Cliff Lede 75, Curves & Edges 100, Desire Lines 100, Farella 95, Green & Red 85, Hourglass 85, Ink Grade 175, Jonata 230, Keever 110, Lail Georgia 320, Land of Saints 65, Lieu Dit 72, Monte Rio 65, Perchance 185, Peter Michael 200, Presqu'ile 70, Quattro Theory 80, Realm 144/285, REWA 170, Rochioli 150, Sentium 220, Soliste Lune 85, Soliste St. Andelain 160, St. Supery 85, Trione 80
**Chardonnay:**
4900 Cellars 56, Amor Fati 155, Ceritas Peter Martin Ray 225, Daou Reserve 85, Desparada Wayfinder 125, Folk Machine 95, Land of Saints 65, Mindego Ridge 145, Mount Eden 270, Domaine Eden 100, Racines Sanford & Benedict 240, Rhys Alesia 100, Rhys Mt. Pajaro 255, Sea Smoke 250, Wente Riva Ranch 60, Aubert Hudson 515, Hudson 215, Shafer Red Shoulder 185, TOR Beresini 265, Aubert Park Ave 430, Aubert Powder House 490, Copain Tous Ensemble 85, Crossbarn 95, Failla Estate 160, Failla Platt 175, Hirsch 220, Kistler Les Noisetiers 205, Littorai Heintz 295/300, Matthiasson Michael Mara 220, Maxem UV 225, Peay 150, Raen Lady Marjorie 220, Walt 110, Wayfarer 235, Paul Hobbs 165, Ramey 112/195/220/200, Soliste l’Age d’Or 125, Williams Selyem Allen 310, Drake 290, Estate 300
**Rosé:**
Bannister 75, George Ferae Naturae 85, Realm La Fe 195, Red Car 65, Robert Sinskey 105, Stolpman Love You Bunches 60, Tablas Creek Patelin 80, Turley White Zin 65
**Pinot Noir (All Regions Combined):**
Admire 95, Aston 108, Boars' View The Coast 390/300, Carpenter La Tâche 130, Ceritas Hellenthal 280/320, DuMOL MacIntyre 280, Kistler SC 295, Kosta Browne 440/370, Littorai 220, Marcassin 400, Matt Taylor 115, Occidental Bodega Headlands 275, Bodega Ridge 345, Running Fence 285, Peay Estate 250, Peay Ama 230, Raen Royal St. Robert 230, Ram’s Gate 135, Red Car 105, Soliste Les Griottes 290, Narcisse 120, Wayfarer 300/235, Arista 220/260, August West 145, Bannister GV 120, Dehlinger 190, Failla Keefer 175, Failla Olivet 140, George Ceremonial 175, George Leras 200, Joseph Swan 195, Williams Selyem 245–475
**Syrah, Grenache, Rhône Blends:**
Alban Reva 270–310, Desire Lines 80, Epoch Paderewski 270, Jolie Laide 100/135, Lillian 420, Pax Grizzly Peak 185, Rhys Horseshoe 315, Sine Qua Non 530–755, Grace Grenache 95/215, Copia The Story 170, Destinata 65, Stolpman Estate 80/85, Language of Yes 110, Andremily EABA 370, Birchino Scylla 75/80, Booker Oublié 205, Chasing Windmills 230, Cochon Pape Rocks 85, Keplinger 240–260, L’Aventure Côte a Côte 275, Neyers Sage Canyon 65, Sans Liege The Offering 80, Saxum 365–470, Stolpman Sun & Earth 180, Tablas Creek 80/215/220, Villa Creek 75/190
**Zinfandel, Merlot, Cab Franc, Petite Sirah, Other Reds:**
Bannister Zinfandel 105, Dashe 80, Easton 65, Hendry HRW 80, Keenan Zin 140, Martinelli 155, Matthiasson Zinfandel 150, Ridge Lytton Springs 155, Biale R.W. Moore 140, Stagecoach 165, Sinskey Commander Zinskey 195, Turley Estate 150, Arietta Merlot 240, Farella 115–135, Hawkes 125, Kongsgaard 495, Margarett's Merlot 52, Trig Point 80, Ashes & Diamonds CF 200, Detert CF 400, Gallica Petite Sirah 165, Grady 50, Jaffurs 105, True Grit 65, Turley 230–300, Aeris NM 140, Andis Barbera 70, Bannister Sagrantino 125, Booker Tempranillo 255, Cline Mourvèdre 115, Pax Mission 95, Vented Aglianico 105, Whitcraft Gamay 155"]

  restaurant_names.each_with_index do |rest_name, index|
    restaurant = Restaurant.new
    restaurant.restaurant_name = rest_name
    restaurant.wine_menu       = wine_menus.at(index)
    restaurant.save
  end

  p "Added #{Restaurant.count} Restaurants"

end
