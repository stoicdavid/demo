//
//  ResourceManager.m
//  VisualAid
//
//  Created by David Rodriguez on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import "ResourceManager.h"

@implementation ResourceManager
@synthesize products,resources,downloadedAids,downloadedExtras,downloadedVideos;


- (void) eraseResources{
    [resources release];
    resources = [[NSMutableArray alloc] init];
    
}

- (id) init
{
    if ((self = [super init])) {
        products = [[NSMutableDictionary alloc]initWithCapacity:18]; 
        resources = [[NSMutableArray alloc] init];
        //self.downloadedAids=YES;
        //Brilinta
        aids = [[NSMutableArray alloc] initWithObjects:@"AVBrilinta", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Apoyo Visual Brilinta", nil];
        
        
            [aids addObject:@"visualAid"];
            [aidsK addObject:@"Prueba Descarga AV"];
        

        
        extras = [[NSMutableArray alloc] initWithObjects:@"RAEstudioPlato", nil];
        extrasK = [[NSMutableArray alloc] initWithObjects:@"Recurso Adicional Estudio Plato", nil] ;        
        
            [extras addObject:@"extraMaterial"];
            [extrasK addObject:@"Prueba Descarga Extra"];
    
        videos = [[NSMutableArray alloc] initWithObjects:@"TicagrelorMecanismodeAccion", nil];
        videosK = [[NSMutableArray alloc] initWithObjects:@"Ticagrelor Mecanismo de Acción", nil] ;        
    
            [videos addObject:@"videos"];
            [videosK addObject:@"Prueba Descarga Video"];
    
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        extrasD = [[NSDictionary alloc] initWithObjects:extras forKeys:extrasK];
        videosD = [[NSDictionary alloc] initWithObjects:videos forKeys:videosK];
        
        [resources addObject:@"Brilinta"];
        [resources addObject:aidsD];
        [resources addObject:extrasD];
        [resources addObject:videosD];
        
        [resources addObject:@"111"];
        [products setObject:resources forKey:[NSNumber numberWithInt:1]];
        
        [self eraseResources];
        

        
        //Crestor
        extras = [[NSMutableArray alloc] initWithObjects:@"AVOEtarjetonATORVASTATINA",@"AVOEtarjetonesCOMBINACION", nil];
        extrasK = [[NSMutableArray alloc] initWithObjects:@"Folder de Precios Atorvastina",@"Folder de Precios Combinación", nil];        
        extrasD = [[NSDictionary alloc] initWithObjects:extras forKeys:extrasK];
        
        [resources addObject:@"Crestor"];
        [resources addObject:@""];
        [resources addObject:extrasD];

        [resources addObject:@"010"];   
        [products setObject:resources forKey:[NSNumber numberWithInt:2]];
        
        [self eraseResources];
        
        //Onglyza
        aids = [[NSMutableArray alloc] initWithObjects:@"AVOnglyza", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Apoyo Visual Onglyza", nil];        
        extras = [[NSMutableArray alloc] initWithObjects:@"RAEstructuraPromocionalSeguridadEficacia",@"RAEstudioSeguridadEficacia", nil];
        extrasK = [[NSMutableArray alloc] initWithObjects:@"Estructura Promocional Seguridad Eficacia", @"Estudio Seguridad Eficacia", nil] ;        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        extrasD = [[NSDictionary alloc] initWithObjects:extras forKeys:extrasK];
        
        
        [resources addObject:@"Onglyza"];
        [resources addObject:aidsD];
        [resources addObject:extrasD];
        [resources addObject:@"110"];
        [products setObject:resources forKey:[NSNumber numberWithInt:3]];
        
        [self eraseResources];
        
        
        //Atacand
        
        extras = [[NSMutableArray alloc] initWithObjects:@"AVTarjetonAtacand", nil];
        extrasK = [[NSMutableArray alloc] initWithObjects:@"Tarjetón Beneficios Atacand", nil];        
        extrasD = [[NSDictionary alloc] initWithObjects:extras forKeys:extrasK];
        
        
        
        [resources addObject:@"Atacand"];
        [resources addObject:@""];
        [resources addObject:extrasD];
        [resources addObject:@"010"];
        [products setObject:resources forKey:[NSNumber numberWithInt:4]];
        
        [self eraseResources];
        
        //Nexium 2.5
        aids = [[NSMutableArray alloc] initWithObjects:@"AVNexium2_5", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Nexium Sachets 2.5", nil];        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        
        [resources addObject:@"Nexium2.5"];
        [resources addObject:aidsD];
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:5]];
        
        [self eraseResources];
        
        //Nexium Mups
        
        
        aids = [[NSMutableArray alloc] initWithObjects:@"AVNexiumMups", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Nexium Mups", nil];        
        extras = [[NSMutableArray alloc] initWithObjects:@"RADipticoRIMA",@"RATarjetonAtlasparaiPad",@"RATarjetonNexiumMups",@"RATripticoRIMA", nil];
        extrasK = [[NSMutableArray alloc] initWithObjects:@"Díptico RIMA",@"Tarjetón Atlas para iPad",@"Tarjetón Nexium Mups Institucionales",@"Tríptico RIMA", nil] ;        
        videos = [[NSMutableArray alloc] initWithObjects: nil];
        videosK = [[NSMutableArray alloc] initWithObjects: nil] ;        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        extrasD = [[NSDictionary alloc] initWithObjects:extras forKeys:extrasK];
        videosD = [[NSDictionary alloc] initWithObjects:videos forKeys:videosK];
        
        [resources addObject:@"NexiumMups"];
        [resources addObject:aidsD];
        [resources addObject:extrasD];
        [resources addObject:videosD];
        [resources addObject:@"110"];
        [products setObject:resources forKey:[NSNumber numberWithInt:6]];
        
        [self eraseResources];
        
        
        //Pulmicort
        
        aids = [[NSMutableArray alloc] initWithObjects:@"TarjetonPresentacionesPulmicort", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Tarjetón de Presentaciones Pulmicort", nil];        
        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        [resources addObject:@"Pulmicort"];
        [resources addObject:aidsD];
        
        
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:7]];
        
        [self eraseResources];
        
        
        //Rhinocort
        
        aids = [[NSMutableArray alloc] initWithObjects:@"TarjetonPresentacionesRhinocort", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Tarjetón de Presentaciones Rhinocort", nil];        
        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        [resources addObject:@"Rhinocort"];
        [resources addObject:aidsD];
        
        
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:8]];
        
        [self eraseResources];    
        
        
        //Symbicort
        
        aids = [[NSMutableArray alloc] initWithObjects:@"TarjetonSymbicortInstitucionales",@"TarjetonAtlasiPad(Respiratorio)",@"TarjetonPrecios(VannairSimbicort)",@"TarjetonpresentacionesSymbicort", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Tarjetón Symbicort-Institucionales",@"Tarjetón Atlas (Respiratorio)",@"Tarjetón Precios (Vannair y Symbicort)",@"Tarjetón de Presentaciones Symbicort", nil];        
        
        videos = [[NSMutableArray alloc] initWithObjects:@"B2agonista",@"Budesonida",@"corticoidesinhalados",@"Mecanismocorticoides",@"mecanismoSymbicort",@"Rutacorticoides", nil];
        videosK = [[NSMutableArray alloc] initWithObjects:@"Mecanismo de acción B2 agonista LABA",@"Budesonida y formoterol efecto sinérgico único",@"Duración de la acción de los corticoides inhalados",@"Mecanismo de acción corticoides inhalados",@"Funcionamiento y mecanismo de Symbicort Turbuhaler",@"Ruta de los corticoides inhalados", nil] ;        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        videosD = [[NSDictionary alloc] initWithObjects:videos forKeys:videosK];
        
        [resources addObject:@"Symbicort"];
        [resources addObject:aidsD];
        [resources addObject:@""];
        [resources addObject:videosD];
        [resources addObject:@"101"];
        [products setObject:resources forKey:[NSNumber numberWithInt:9]];
        
        [self eraseResources];
        
        
        
        //Vannair
        extras = [[NSMutableArray alloc] initWithObjects:@"TarjetonAtlas",@"TarjetonPresentacionesVannair",@"TarjetonPrecios", nil];
        extrasK = [[NSMutableArray alloc] initWithObjects:@"Tarjetón Atlas para iPad (Respiratorio)",@"Tarjetón de Presentaciones Vannair",@"Tarjetón Precios", nil];        
        
        extrasD = [[NSDictionary alloc] initWithObjects:extras forKeys:extrasK];
        
        
        [resources addObject:@"Vannair"];
        [resources addObject:@""];
        [resources addObject:extrasD];        
        
        [resources addObject:@"010"];
        [products setObject:resources forKey:[NSNumber numberWithInt:10]];
        
        [self eraseResources]; 
        
        
        //Seroquel
        
        aids = [[NSMutableArray alloc] initWithObjects:@"AVEsquizofrenia",@"AVTrastornoBipolar", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Esquizofrenia",@"Trastorno Bipolar", nil];        
        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        [resources addObject:@"Seroquel"];
        [resources addObject:aidsD];
        
        
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:11]];
        
        [self eraseResources];    
        
        
        
        //Merrem
        
        
        aids = [[NSMutableArray alloc] initWithObjects:@"TarjetonMerrem", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Tarjetón Merrem", nil];        
        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        [resources addObject:@"Merrem"];
        [resources addObject:aidsD];
        
        
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:12]];
        
        [self eraseResources];    
        
        
        //Salvemos el corazon
        
        aids = [[NSMutableArray alloc] initWithObjects:@"AnuncioSalvemos",@"FolletoRiesgoCardio",@"STANDLCVITAMEDICA",@"STANDLC2VITAMEDICA",@"TarjetonSELOKENSELOPRES", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Anuncio Salvemos",@"Folleto Riesgo Cardio",@"STAND LC VITAMEDICA",@"STAND LC 2 VITAMEDICA",@"Tarjetón SELOKEN SELOPRES", nil];        
        
        videos = [[NSMutableArray alloc] initWithObjects:@"AZDiasPerdidos20",@"AZHistorias20",@"AZLluviaRoja220",@"LluviaRoja60Logo", nil];
        videosK = [[NSMutableArray alloc] initWithObjects:@"Astra Zeneca Días Perdidos 20",@"Astra Zeneca Historias 20",@"Astra Zeneca Lluvia Roja 2 20",@"Lluvia Roja 60 Logo", nil] ;        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        videosD = [[NSDictionary alloc] initWithObjects:videos forKeys:videosK];
        
        [resources addObject:@"SalvemosElCorazon"];
        [resources addObject:aidsD];
        [resources addObject:@""];
        [resources addObject:videosD];
        [resources addObject:@"101"];
        [products setObject:resources forKey:[NSNumber numberWithInt:13]];
        
        [self eraseResources];
        
        
        //Armidex
        aids = [[NSMutableArray alloc] initWithObjects:@"AVArimidex", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Arimidex", nil];        
        extras = [[NSMutableArray alloc] initWithObjects:@"ArimidexBARNIZREGISTRO", nil];
        extrasK = [[NSMutableArray alloc] initWithObjects:@"Arimidex BARNIZ REGISTRO", nil] ;        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        extrasD = [[NSDictionary alloc] initWithObjects:extras forKeys:extrasK];
        
        
        [resources addObject:@"Arimidex"];
        [resources addObject:aidsD];
        [resources addObject:extrasD];
        [resources addObject:@"110"];
        [products setObject:resources forKey:[NSNumber numberWithInt:14]];
        
        [self eraseResources];
        
        
        
        //Casodex-Zoldex
        aids = [[NSMutableArray alloc] initWithObjects:@"AVCasodex_Zoladex", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Casodex-Zoladex", nil];        
        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        [resources addObject:@"Casodex_Zoladex"];
        [resources addObject:aidsD];
        
        
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:15]];
        
        [self eraseResources];   
        
        
        //Iressa
        aids = [[NSMutableArray alloc] initWithObjects:@"AVIressaMutacionEGFR", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Iressa Mutación EGFR", nil];        
        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        [resources addObject:@"Iressa"];
        [resources addObject:aidsD];
        
        
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:16]];
        
        [self eraseResources];   
        
        
        //Fasiodex
        
        aids = [[NSMutableArray alloc] initWithObjects:@"AVFaslodex", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Faslodex", nil];        
        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        [resources addObject:@"Faslodex"];
        [resources addObject:aidsD];
        
        
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:17]];
        
        [self eraseResources];   
        
        
        //Nexium IV
        aids = [[NSMutableArray alloc] initWithObjects:@"TarjetonEficaciaNexiumIV", nil];
        aidsK = [[NSMutableArray alloc] initWithObjects:@"Tarjetón Eficacia Nexium IV", nil];        
        
        aidsD = [[NSDictionary alloc] initWithObjects:aids forKeys:aidsK];
        
        
        [resources addObject:@"NexiumIV"];
        [resources addObject:aidsD];
        
        
        [resources addObject:@"100"];
        [products setObject:resources forKey:[NSNumber numberWithInt:18]];
        
        [self eraseResources];   
        
   
        
        
    }
    return self;
}



- (BOOL) productHasVisualAids:(int)product{
    NSArray *temp = [products objectForKey:[NSNumber numberWithInt:product]];
    NSString *vector = [temp objectAtIndex:temp.count-1];
    NSString *value = [vector substringWithRange:NSMakeRange(0, 1)];
    if ([value isEqualToString:@"1"]){
        
        return YES;
    }else{
        return NO;
    }
}
- (BOOL) productHasExtras:(int)product{
    NSArray *temp = [products objectForKey:[NSNumber numberWithInt:product]];
    NSString *vector = [temp objectAtIndex:temp.count-1];
    NSString *value = [vector substringWithRange:NSMakeRange(1, 1)];
    if ([value isEqualToString:@"1"]){
        
        return YES;
    }else{
        return NO;
    }
    
}
- (BOOL) productHasVideos:(int)product{
    NSArray *temp = [products objectForKey:[NSNumber numberWithInt:product]];
    NSString *vector = [temp objectAtIndex:temp.count-1];
    NSString *value = [vector substringWithRange:NSMakeRange(2, 1)];
    if ([value isEqualToString:@"1"]){
        
        return YES;
    }else{
        return NO;
    }    
    
}
- (NSString *) nameOfProduct:(int)indexOfProduct{
    
    NSArray *temp = [products objectForKey:[NSNumber numberWithInt:indexOfProduct]];
    NSString *tempo = [temp objectAtIndex:0];
    return tempo;
    
}

- (NSDictionary *) visualAidsByProduct:(int)indexOfProduct{
    if ([self productHasVisualAids:indexOfProduct]){
        NSArray *temp = [products objectForKey:[NSNumber numberWithInt:indexOfProduct]];
        NSDictionary *tempo = [temp objectAtIndex:1];
        return tempo;
    }else{
        return nil;
    }
}

- (NSDictionary *) extrasByProduct:(int)indexOfProduct{
    if ([self productHasExtras:indexOfProduct]){
        NSArray *temp = [products objectForKey:[NSNumber numberWithInt:indexOfProduct]];
        NSDictionary *tempo = [temp objectAtIndex:2];
        return tempo;
    }else{
        return nil;
    }
    
}
- (NSDictionary *) videosByProduct:(int)indexOfProduct{
    if ([self productHasVideos:indexOfProduct]){
        NSArray *temp = [products objectForKey:[NSNumber numberWithInt:indexOfProduct]];
        NSDictionary *tempo = [temp objectAtIndex:3];
        return tempo;
    }else{
        return nil;
    }    
}

- (void) dealloc{
    
    [products release];
    [resources release];
    [aids release];
    [extras release];
    [videos release];
    [aidsK release];
    [extrasK release];
    [videosK release];
    [aidsD release];
    [extrasD release];
    [videosD release];
    [super dealloc];
}

@end
