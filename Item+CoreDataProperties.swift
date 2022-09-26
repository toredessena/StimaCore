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
    
    public func assegnazioneBarriere() -> String {
        if totBarrier == 0.00 {
            return "L'immobile non risulta certificato"
        } else if totBarrier == 0.05 {
            return "L'immobile risulta certificato per il requisito dell'adattabilità ai sensi del DPR 236/96"
        } else if totBarrier == 0.10 {
            return "L'immobile risulta certificato per il requisito della visitabilità ai sensi del DPR 236/96"
        } else if totBarrier == 0.15 {
            return "L'immobile risulta certificato per il requisito dell'accessibilità ai sensi del DPR 236/96"
        }
         return "L'immobile non risulta certificabile"
    }
    
    public func assegnazioneSismica() -> String {
        if totSismaConv == 0.00 {
            return "L'immobile risulta certificato per la Classe Sismica G"
        } else if totSismaConv == 0.05 {
            return "L'immobile risulta certificato per la Classe Sismica F"
        } else if totSismaConv == 0.10 {
            return "L'immobile risulta certificato per la Classe Sismica E"
        } else if totSismaConv == 0.15 {
            return "L'immobile risulta certificato per la Classe Sismica D"
        } else if totSismaConv == 0.20 {
            return "L'immobile risulta certificato per la Classe Sismica C"
        } else if totSismaConv == 0.25 {
            return "L'immobile risulta certificato per la Classe Sismica B"
        } else if totSismaConv == 0.30 {
            return "L'immobile risulta certificato per la Classe Sismica A"
        } else if totSismaConv == 0.35 {
            return "L'immobile risulta certificato per la Classe Sismica A+"
        }
        
         return "L'immobile non risulta certificabile"
    }
    
    public func assegnazioneEnergetica() -> String {
        if valoreCertThermo == -0.40 {
            return "L'immobile risulta certificato per la Classe Energetica G"
        } else if valoreCertThermo == -0.30 {
            return "L'immobile risulta certificato per la Classe Energetica F"
        } else if valoreCertThermo == -0.20 {
            return "L'immobile risulta certificato per la Classe Energetica E"
        } else if valoreCertThermo == -0.10 {
            return "L'immobile risulta certificato per la Classe Energetica D"
        } else if valoreCertThermo == -0.10 {
            return "L'immobile risulta certificato per la Classe Energetica C"
        } else if valoreCertThermo == 0.00 {
            return "L'immobile risulta certificato per la Classe Energetica B"
        } else if valoreCertThermo == 0.10 {
            return "L'immobile risulta certificato per la Classe Energetica A1"
        } else if valoreCertThermo == 0.20 {
            return "L'immobile risulta certificato per la Classe Energetica A2"
        } else if valoreCertThermo == 0.30 {
            return "L'immobile risulta certificato per la Classe Energetica A3"
        } else if valoreCertThermo == 0.40 {
            return "L'immobile risulta certificato per la Classe Energetica A4"
        }
        
         return "L'immobile non risulta certificabile"
    }
    
    public func assegnaValoreMuri() -> String {
        if structValue == -0.20 {
         return   "Il livello di qualità dell'involucro murario risulta scarso"
        } else if structValue == -0.10 {
            return "Il livello di qualità dell'involucro murario risulta mediocre"
        } else if structValue == 0.00 {
            return "Il livello di qualità dell'involucro murario risulta ordinario"
        } else if structValue == 0.10 {
            return "Il livello di qualità dell'involucro murario risulta discreto"
        } else if structValue == 0.20 {
            return "Il livello di qualità dell'involucro murario risulta buono"
        }
    return "nulla"
    }
    
    public func assegnaValoreSolai() -> String {
        if roofValue == -0.20 {
         return   "Il livello di qualità di solai e orizzontamenti risulta scarso"
        } else if roofValue == -0.10 {
            return "Il livello di qualità di solai e orizzontamenti risulta mediocre"
        } else if roofValue == 0.00 {
            return "Il livello di qualità di solai e orizzontamenti risulta ordinario"
        } else if roofValue == 0.10 {
            return "Il livello di qualità di solai e orizzontamenti risulta discreto"
        } else if roofValue == 0.20 {
            return "Il livello di qualità di solai e orizzontamenti risulta buono"
        }
    return "nulla"
    }
    
    public func assegnaValoreInfissi() -> String {
        if windowsValue == -0.20 {
         return   "Il livello di qualità di infissi e chiusure risulta scarso"
        } else if windowsValue == -0.10 {
            return "Il livello di qualità di infissi e chiusure risulta mediocre"
        } else if windowsValue == 0.00 {
            return "Il livello di qualità di infissi e chiusure risulta ordinario"
        } else if windowsValue == 0.10 {
            return "Il livello di qualità di infissi e chiusure risulta discreto"
        } else if windowsValue == 0.20 {
            return "Il livello di qualità di infissi e chiusure risulta buono"
        }
    return "nulla"
    }
    
    public func assegnaValoreIntonaci() -> String {
        if plastersValue == -0.20 {
         return   "Il livello di qualità di intonaci e rivestimenti risulta scarso"
        } else if plastersValue == -0.10 {
            return "Il livello di qualità di intonaci e rivestimenti risulta mediocre"
        } else if plastersValue == 0.00 {
            return "Il livello di qualità di intonaci e rivestimenti risulta ordinario"
        } else if plastersValue == 0.10 {
            return "Il livello di qualità di intonaci e rivestimenti risulta discreto"
        } else if plastersValue == 0.20 {
            return "Il livello di qualità di intonaci e rivestimenti risulta buono"
        }
    return "nulla"
    }
    
    public func assegnaValoreImpianti() -> String {
        if installationsValue == -0.20 {
         return   "Il livello di qualità di intonaci e rivestimenti risulta scarso"
        } else if installationsValue == -0.10 {
            return "Il livello di qualità di intonaci e rivestimenti risulta mediocre"
        } else if installationsValue == 0.00 {
            return "Il livello di qualità di intonaci e rivestimenti risulta ordinario"
        } else if installationsValue == 0.10 {
            return "Il livello di qualità di intonaci e rivestimenti risulta discreto"
        } else if installationsValue == 0.20 {
            return "Il livello di qualità di intonaci e rivestimenti risulta buono"
        }
    return "nulla"
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
    
    Qualità delle murature: \(assegnaValoreMuri())
    Qualità dei solai: \(assegnaValoreSolai())
    Qualità degli infissi: \(assegnaValoreInfissi())
    Qualità di intonaci e tinteggiature: \(assegnaValoreIntonaci())
    Qualità degli impianti: \(assegnaValoreImpianti())
    Qualità di pavimenti e rivestimenti:
    
    Per l'immobile considerato il valore di conservazione VC corrisponde a Euro \(valoreDiConservazione.rounded())
    
    Valore di Posizione.
    Sul valore di conservazione vengono applicati i parametri necessari a operare una valutazione relativa alla collocazione dell'immobile, alla sua accessibilità rispetto al contesto circostante, al pregio di quest'ultimo, all'esposizione e alla flessibilità circa le possibili trasformazioni.
    Per l'immobile considerato il valore ottenuto corrisponde a Euro \(valoreDiPosizione.rounded())
    
    Certificazioni.
    Il valore dell'immobile varia infine in ragione delle certificazioni possedute dallo stesso così da comporre il valore finale
    In particolare:
    - certificazione sismica: \(assegnazioneSismica())
    - certificazione sull'abbattimento delle barriere architettoniche: \(assegnazioneBarriere())
    - certificazione energetica: \(assegnazioneEnergetica())
    
    Il Valore di stima finale per l'immobile oggetto di stima, pertanto, è fissato in Euro \(valoreFinale.rounded()).
    
    Il Tecnico
    \(nome ?? "")
    """
    }
}


extension Item : Identifiable {

    
}




