INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Influenza'
  AND m.medicine = 'Paracetamol'
  AND NOT EXISTS (SELECT 1
                  FROM disease_medicine dm
                  WHERE dm.disease_id = d.id
                    AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Influenza'
  AND m.medicine = 'Ibuprofen';
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Influenza'
  AND m.medicine = 'Azithromycin'
  AND NOT EXISTS (SELECT 1
                  FROM disease_medicine dm
                  WHERE dm.disease_id = d.id
                    AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Influenza'
  AND m.medicine = 'Amoxicillin'
  AND NOT EXISTS(SELECT 1
                 FROM disease_medicine dm
                 WHERE dm.disease_id = d.id
                   AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Dengue'
  AND m.medicine = 'Paracetamol'
  AND NOT EXISTS(SELECT 1
                 FROM disease_medicine dm
                 WHERE dm.disease_id = d.id
                   AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Dengue'
  AND m.medicine = 'Ibuprofen'
  AND NOT EXISTS(SELECT 1
                 FROM disease_medicine dm
                 WHERE dm.disease_id = d.id
                   AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Dengue'
  AND m.medicine = 'Azithromycin'
  AND NOT EXISTS(SELECT 1
                 FROM disease_medicine dm
                 WHERE dm.disease_id = d.id
                   AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Dengue'
  AND m.medicine = 'Amoxicillin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Viral Fever'
  AND m.medicine = 'Paracetamol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Viral Fever'
  AND m.medicine = 'Ibuprofen'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Viral Fever'
  AND m.medicine = 'Azithromycin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Viral Fever'
  AND m.medicine = 'Amoxicillin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Typhoid'
  AND m.medicine = 'Paracetamol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Typhoid'
  AND m.medicine = 'Ibuprofen'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Typhoid'
  AND m.medicine = 'Azithromycin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Typhoid'
  AND m.medicine = 'Amoxicillin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'COVID-19'
  AND m.medicine = 'Paracetamol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'COVID-19'
  AND m.medicine = 'Ibuprofen'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'COVID-19'
  AND m.medicine = 'Azithromycin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'COVID-19'
  AND m.medicine = 'Amoxicillin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Common Cold'
  AND m.medicine = 'Salbutamol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Common Cold'
  AND m.medicine = 'Montelukast'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Common Cold'
  AND m.medicine = 'Cetirizine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Bronchitis'
  AND m.medicine = 'Salbutamol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Bronchitis'
  AND m.medicine = 'Montelukast'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Bronchitis'
  AND m.medicine = 'Cetirizine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Asthma'
  AND m.medicine = 'Salbutamol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Asthma'
  AND m.medicine = 'Montelukast'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Asthma'
  AND m.medicine = 'Cetirizine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Pneumonia'
  AND m.medicine = 'Salbutamol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Pneumonia'
  AND m.medicine = 'Montelukast'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Pneumonia'
  AND m.medicine = 'Cetirizine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Gastritis'
  AND m.medicine = 'Omeprazole'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Gastritis'
  AND m.medicine = 'Pantoprazole'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Gastritis'
  AND m.medicine = 'Ondansetron'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Gastritis'
  AND m.medicine = 'ORS'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'GERD'
  AND m.medicine = 'Omeprazole'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'GERD'
  AND m.medicine = 'Pantoprazole'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'GERD'
  AND m.medicine = 'Ondansetron'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'GERD'
  AND m.medicine = 'ORS'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Food Poisoning'
  AND m.medicine = 'Omeprazole'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Food Poisoning'
  AND m.medicine = 'Pantoprazole'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Food Poisoning'
  AND m.medicine = 'Ondansetron'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Food Poisoning'
  AND m.medicine = 'ORS'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'IBS'
  AND m.medicine = 'Omeprazole'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'IBS'
  AND m.medicine = 'Pantoprazole'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'IBS'
  AND m.medicine = 'Ondansetron'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'IBS'
  AND m.medicine = 'ORS'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Migraine'
  AND m.medicine = 'Aspirin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Migraine'
  AND m.medicine = 'Amitriptyline'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Migraine'
  AND m.medicine = 'Diazepam'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Epilepsy'
  AND m.medicine = 'Aspirin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Epilepsy'
  AND m.medicine = 'Amitriptyline'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Epilepsy'
  AND m.medicine = 'Diazepam'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hypertension'
  AND m.medicine = 'Amlodipine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hypertension'
  AND m.medicine = 'Losartan'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hypertension'
  AND m.medicine = 'Metoprolol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hypotension'
  AND m.medicine = 'Amlodipine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hypotension'
  AND m.medicine = 'Losartan'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hypotension'
  AND m.medicine = 'Metoprolol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Heart Failure'
  AND m.medicine = 'Amlodipine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Heart Failure'
  AND m.medicine = 'Losartan'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Heart Failure'
  AND m.medicine = 'Metoprolol'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Anxiety Disorder'
  AND m.medicine = 'Alprazolam'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Anxiety Disorder'
  AND m.medicine = 'Sertraline'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Anxiety Disorder'
  AND m.medicine = 'Fluoxetine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Depressive Disorder'
  AND m.medicine = 'Alprazolam'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Depressive Disorder'
  AND m.medicine = 'Sertraline'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Depressive Disorder'
  AND m.medicine = 'Fluoxetine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Insomnia'
  AND m.medicine = 'Alprazolam'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Insomnia'
  AND m.medicine = 'Sertraline'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Insomnia'
  AND m.medicine = 'Fluoxetine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Muscle Strain'
  AND m.medicine = 'Diclofenac'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Muscle Strain'
  AND m.medicine = 'Aceclofenac'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Muscle Strain'
  AND m.medicine = 'Naproxen'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Arthritis'
  AND m.medicine = 'Diclofenac'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Arthritis'
  AND m.medicine = 'Aceclofenac'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Arthritis'
  AND m.medicine = 'Naproxen'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'UTI'
  AND m.medicine = 'Ciprofloxacin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'UTI'
  AND m.medicine = 'Doxycycline'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Kidney Stones'
  AND m.medicine = 'Ciprofloxacin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Kidney Stones'
  AND m.medicine = 'Doxycycline'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Skin Allergy'
  AND m.medicine = 'Hydrocortisone'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Skin Allergy'
  AND m.medicine = 'Cetirizine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Psoriasis'
  AND m.medicine = 'Hydrocortisone'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Psoriasis'
  AND m.medicine = 'Cetirizine'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Diabetes'
  AND m.medicine = 'Metformin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Diabetes'
  AND m.medicine = 'Insulin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hypothyroidism'
  AND m.medicine = 'Metformin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hypothyroidism'
  AND m.medicine = 'Insulin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hyperthyroidism'
  AND m.medicine = 'Metformin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);
INSERT IGNORE INTO disease_medicine (disease_id, medicine_id)
SELECT d.id, m.id
FROM disease d,
     medicine m
WHERE d.disease_name = 'Hyperthyroidism'
  AND m.medicine = 'Insulin'
  AND NOT EXISTS(SELECT 1 FROM disease_medicine dm WHERE dm.disease_id = d.id AND dm.medicine_id = m.id);