//
//  Item+CoreDataProperties.swift
//  StimaCore
//
//  Created by salvatore dessena on 24/02/22.
//
//

import Foundation
import CoreData
import SwiftUI

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var completion: Bool
    @NSManaged public var costoMq: Double
    @NSManaged public var id: UUID?
    @NSManaged public var snr: Double
    @NSManaged public var cellar: Double
    @NSManaged public var plot: Double
    @NSManaged public var superficie: Double
    @NSManaged public var timestamp: Date?
    
    @NSManaged public var title: String?
    @NSManaged public var via: String
    @NSManaged public var comune: String?
    @NSManaged public var foglio: String?
    @NSManaged public var mappale: String?
    @NSManaged public var sub: String?
    @NSManaged public var nome: String?
    @NSManaged public var order: String?
    @NSManaged public var provincia: String?
    @NSManaged public var numeroIscrizione: String?
    @NSManaged public var indirizzoTecnico: String?
    
    @NSManaged public var structValue: Double
    @NSManaged public var roofValue: Double
    @NSManaged public var windowsValue: Double
    @NSManaged public var plastersValue: Double
    @NSManaged public var installationsValue: Double
    @NSManaged public var floorsValue: Double
    @NSManaged public var accessibilitaValue: Double
    @NSManaged public var esposizioneValue: Double
    @NSManaged public var trasformabilitaValue: Double
    @NSManaged public var ubicazioneValue: Double
    @NSManaged public var thermoValue: Double
    @NSManaged public var sismaValueConv: Double
    @NSManaged public var barrierValue: Double
    

    public var supRagg: Double {
        superficie + snr * 0.30 + cellar * 0.40 + plot * 0.10
    }
    
    public var valoreDiMercato: Double {
        costoMq * supRagg
    }
    
    public var valoreDiConservazione: Double {
        valoreDiMercato * 0.25 * structValue + valoreDiMercato * 0.13 * roofValue + valoreDiMercato * 0.12 * windowsValue + valoreDiMercato * 0.1 * plastersValue + valoreDiMercato * 0.25 * installationsValue + valoreDiMercato * 0.15 * floorsValue + valoreDiMercato
    }
    
    public var valoreDiPosizione: Double {
        valoreDiConservazione + ubicazioneValue * valoreDiConservazione + trasformabilitaValue * valoreDiConservazione + esposizioneValue * valoreDiConservazione + accessibilitaValue * valoreDiConservazione
    }
    
    public var valoreCertThermo: Double {
        thermoValue / 100 * valoreDiPosizione
    }
    
    public var totSismaConv: Double {
        sismaValueConv / 100 * valoreDiPosizione
    }
    
    public var totBarrier: Double {
        barrierValue / 100 * valoreDiPosizione
    }
    
    
    // valore certificazioni sul valore di posizione, tutte, e poi sommare

    public var valoreFinale: Double {
        valoreDiPosizione + valoreCertThermo + totSismaConv + totBarrier
    }
    
   

    
    public var stringa: String {
    """
    Relazione di stima.
    Il giorno \(timestamp?.formatted() ?? "") il sottoscritto \(nome ?? ""), iscritto all'ordine degli \(order ?? "") della provincia di \(provincia ?? "") al numero \(numeroIscrizione ?? ""), con studio in \(indirizzoTecnico ?? ""), su espresso incarico del Committente ha redatto la seguente relazione di stima per l'immobile di seguito descritto.
    
    Ubicazione.
    L'immobile oggetto di stima risulta ubicato nel comune di \(comune ?? "-") in via \(via) e contraddistinto al NCEU al foglio \(foglio ?? ""), mappale \(mappale ?? "") e subalterno \(sub ?? "").
    
    Caratteristiche dell'immobile.
    La superficie dell'immobile risulta così composta:
    - Superficie utile: mq. \(superficie),
    - Superficie non residenziale: mq. \(snr),
    - Piani interrati o seminterrati: mq. \(cellar),
    - Corti, logge e spazi aperti: mq.\(plot),
    per una superficie ragguagliata ai fini del calcolo pari a mq. \(supRagg).
    
    Operazioni di stima.
    
    Valore di Partenza.
    Il valore di partenza per la stima risulta dal prodotto della superficie ragguagliata moltiplicato per il valore corrente di mercato riferito a fabbricati di nuova costruzione nel comune di \((comune ?? "-")) e località affini pari a Euro \(costoMq).
    Il valore di partenza ottenuto per l'immobile oggetto di stima ammonta a Euro \(valoreDiMercato.rounded()).
    
    Valore di Conservazione.
    Sul valore di partenza é stato quindi possibile operare il calcolo atto a stabilire il cosiddetto Valore di Conservazione, ossia la variazione del valore immobiliare derivante dalla qualità dei componenti edilizi in ragione della rispettiva incidenza percentuale.
    Per l'immobile considerato il valore di conservazione VC corrisponde a Euro \(valoreDiConservazione.rounded())
    
    Valore di Posizione.
    Sul valore di conservazione vengono applicati i parametri necessari a operare una valutazione relativa alla collocazione dell'immobile, alla sua accessibilità rispetto al contesto circostante, al pregio di quest'ultimo, all'esposizione e alla flessibilità circa le possibili trasformazioni.
    Per l'immobile considerato il valore ottenuto corrisponde a Euro \(valoreDiPosizione.rounded())
    
    Certificazioni.
    Il valore dell'immobile varia infine in ragione delle certificazioni possedute dallo stesso così da comporre il valore finale
    In particolare:
    - certificazione sismica: l'immobile risulta/non risulta certificato per la classe: _
    - certificazione sull'abbattimento delle barriere architettoniche: l'immobile risulta/non risulta certificato per la classe: _
    - certificazione energetica: l'immobile risulta/non risulta certificato per la classe: _
    
    Il Valore di stima finale per l'immobile oggetto di stima, pertanto, è fissato in Euro \(valoreFinale.rounded()).
    
    Il Tecnico
    \(nome ?? "")
    """
    }
}


extension Item : Identifiable {

    
}




