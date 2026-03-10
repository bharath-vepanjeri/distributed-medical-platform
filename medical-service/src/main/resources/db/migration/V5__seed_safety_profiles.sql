USE medical_db;
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Symptom relief', 'As directed', 'Safe', 'LOW',
        (SELECT id FROM medicine WHERE medicine = 'Paracetamol'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Pain & inflammation', 'As prescribed', 'Avoid', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Ibuprofen'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Pain & inflammation', 'As prescribed', 'Avoid', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Aspirin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Pain & inflammation', 'As prescribed', 'Avoid', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Diclofenac'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Pain & inflammation', 'As prescribed', 'Avoid', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Aceclofenac'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Pain & inflammation', 'As prescribed', 'Avoid', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Naproxen'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Ketorolac'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Tramadol'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Critical condition', 'Strict supervision', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Morphine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Codeine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Bacterial infection', 'Course based', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Amoxicillin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Bacterial infection', 'Course based', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Azithromycin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Bacterial infection', 'Course based', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Ciprofloxacin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Bacterial infection', 'Course based', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Doxycycline'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Cephalexin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Bacterial infection', 'Course based', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Cefixime'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Bacterial infection', 'Course based', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Ceftriaxone'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Metronidazole'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Clarithromycin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Levofloxacin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Omeprazole'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Pantoprazole'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Esomeprazole'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Famotidine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Domperidone'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Metoclopramide'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Ondansetron'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Symptom relief', 'As directed', 'Safe', 'LOW', (SELECT id FROM medicine WHERE medicine = 'ORS'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Lactulose'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Symptom relief', 'As directed', 'Safe', 'LOW', (SELECT id FROM medicine WHERE medicine = 'Cetirizine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Loratadine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Levocetirizine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Montelukast'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Salbutamol'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Budesonide'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Fluticasone'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Ambroxol'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Dextromethorphan'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Diazepam'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Alprazolam'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Clonazepam'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Sertraline'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Fluoxetine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Escitalopram'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Amitriptyline'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Zolpidem'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Melatonin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Amlodipine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Losartan'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Atenolol'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Metoprolol'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Ramipril'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Enalapril'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Hydrochlorothiazide'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Furosemide'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Atorvastatin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Rosuvastatin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Metformin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Glimepiride'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Critical condition', 'Strict supervision', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Insulin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Propranolol'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Critical condition', 'Strict supervision', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Nitroglycerin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Critical condition', 'Strict supervision', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Warfarin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Critical condition', 'Strict supervision', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Heparin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Clopidogrel'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Critical condition', 'Strict supervision', 'Consult doctor', 'HIGH',
        (SELECT id FROM medicine WHERE medicine = 'Digoxin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Allopurinol'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Colchicine'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Prednisolone'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Hydrocortisone'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Betamethasone'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Symptom relief', 'As directed', 'Safe', 'LOW', (SELECT id FROM medicine WHERE medicine = 'Vitamin C'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Symptom relief', 'As directed', 'Safe', 'LOW', (SELECT id FROM medicine WHERE medicine = 'Vitamin D'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Vitamin B12'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('Symptom relief', 'As directed', 'Safe', 'LOW', (SELECT id FROM medicine WHERE medicine = 'Calcium'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Iron'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Zinc'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Magnesium'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Folic Acid'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Multivitamin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Probiotic'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Antacid'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Simethicone'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Bisacodyl'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Senna'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Loperamide'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Rifaximin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Oseltamivir'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Acyclovir'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Valacyclovir'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Remdesivir'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Ivermectin'));
INSERT IGNORE INTO medicine_safety_profile (usage_instructions, dosage, pregnancy_warning, severity, medicine_id)
VALUES ('General therapeutic use', 'As prescribed', 'Consult doctor', 'MEDIUM',
        (SELECT id FROM medicine WHERE medicine = 'Hydroxychloroquine'));