INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fever'
  AND d.disease_name = 'Influenza'
  AND NOT EXISTS(SELECT 1
                 FROM symptom_diseases sd
                 WHERE sd.symptom_id = s.id
                   AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fever'
  AND d.disease_name = 'Dengue'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fever'
  AND d.disease_name = 'Viral Fever'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fever'
  AND d.disease_name = 'Typhoid'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fever'
  AND d.disease_name = 'COVID-19'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'body pain'
  AND d.disease_name = 'Influenza'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'body pain'
  AND d.disease_name = 'Dengue'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'body pain'
  AND d.disease_name = 'Viral Fever'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'body pain'
  AND d.disease_name = 'Typhoid'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'body pain'
  AND d.disease_name = 'COVID-19'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'headache'
  AND d.disease_name = 'Migraine'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'headache'
  AND d.disease_name = 'Epilepsy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'cough'
  AND d.disease_name = 'Common Cold'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'cough'
  AND d.disease_name = 'Bronchitis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'cough'
  AND d.disease_name = 'Asthma'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'cough'
  AND d.disease_name = 'Pneumonia'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'cold'
  AND d.disease_name = 'Common Cold'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'cold'
  AND d.disease_name = 'Bronchitis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'cold'
  AND d.disease_name = 'Asthma'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'cold'
  AND d.disease_name = 'Pneumonia'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'sore throat'
  AND d.disease_name = 'Common Cold'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'sore throat'
  AND d.disease_name = 'Bronchitis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'sore throat'
  AND d.disease_name = 'Asthma'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'sore throat'
  AND d.disease_name = 'Pneumonia'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fatigue'
  AND d.disease_name = 'Influenza'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fatigue'
  AND d.disease_name = 'Dengue'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fatigue'
  AND d.disease_name = 'Viral Fever'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fatigue'
  AND d.disease_name = 'Typhoid'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'fatigue'
  AND d.disease_name = 'COVID-19'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'muscle pain'
  AND d.disease_name = 'Muscle Strain'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'muscle pain'
  AND d.disease_name = 'Arthritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'joint pain'
  AND d.disease_name = 'Muscle Strain'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'joint pain'
  AND d.disease_name = 'Arthritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'nausea'
  AND d.disease_name = 'Gastritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'nausea'
  AND d.disease_name = 'GERD'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'nausea'
  AND d.disease_name = 'Food Poisoning'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'nausea'
  AND d.disease_name = 'IBS'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'vomiting'
  AND d.disease_name = 'Gastritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'vomiting'
  AND d.disease_name = 'GERD'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'vomiting'
  AND d.disease_name = 'Food Poisoning'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'vomiting'
  AND d.disease_name = 'IBS'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'diarrhea'
  AND d.disease_name = 'Gastritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'diarrhea'
  AND d.disease_name = 'GERD'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'diarrhea'
  AND d.disease_name = 'Food Poisoning'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'diarrhea'
  AND d.disease_name = 'IBS'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'abdominal pain'
  AND d.disease_name = 'Gastritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'abdominal pain'
  AND d.disease_name = 'GERD'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'abdominal pain'
  AND d.disease_name = 'Food Poisoning'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'abdominal pain'
  AND d.disease_name = 'IBS'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'chest pain'
  AND d.disease_name = 'Hypertension'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'chest pain'
  AND d.disease_name = 'Hypotension'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'chest pain'
  AND d.disease_name = 'Heart Failure'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'shortness of breath'
  AND d.disease_name = 'Common Cold'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'shortness of breath'
  AND d.disease_name = 'Bronchitis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'shortness of breath'
  AND d.disease_name = 'Asthma'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'shortness of breath'
  AND d.disease_name = 'Pneumonia'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'dizziness'
  AND d.disease_name = 'Migraine'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'dizziness'
  AND d.disease_name = 'Epilepsy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'loss of appetite'
  AND d.disease_name = 'Gastritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'loss of appetite'
  AND d.disease_name = 'GERD'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'loss of appetite'
  AND d.disease_name = 'Food Poisoning'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'loss of appetite'
  AND d.disease_name = 'IBS'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'anxiety'
  AND d.disease_name = 'Anxiety Disorder'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'anxiety'
  AND d.disease_name = 'Depressive Disorder'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'anxiety'
  AND d.disease_name = 'Insomnia'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'depression'
  AND d.disease_name = 'Anxiety Disorder'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'depression'
  AND d.disease_name = 'Depressive Disorder'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'depression'
  AND d.disease_name = 'Insomnia'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'insomnia'
  AND d.disease_name = 'Anxiety Disorder'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'insomnia'
  AND d.disease_name = 'Depressive Disorder'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'insomnia'
  AND d.disease_name = 'Insomnia'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'back pain'
  AND d.disease_name = 'Muscle Strain'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'back pain'
  AND d.disease_name = 'Arthritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'neck pain'
  AND d.disease_name = 'Muscle Strain'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'neck pain'
  AND d.disease_name = 'Arthritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'skin rash'
  AND d.disease_name = 'Skin Allergy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'skin rash'
  AND d.disease_name = 'Psoriasis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'itching'
  AND d.disease_name = 'Skin Allergy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'itching'
  AND d.disease_name = 'Psoriasis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'heartburn'
  AND d.disease_name = 'Gastritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'heartburn'
  AND d.disease_name = 'GERD'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'heartburn'
  AND d.disease_name = 'Food Poisoning'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'heartburn'
  AND d.disease_name = 'IBS'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'acid reflux'
  AND d.disease_name = 'Gastritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'acid reflux'
  AND d.disease_name = 'GERD'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'acid reflux'
  AND d.disease_name = 'Food Poisoning'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'acid reflux'
  AND d.disease_name = 'IBS'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'constipation'
  AND d.disease_name = 'Gastritis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'constipation'
  AND d.disease_name = 'GERD'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'constipation'
  AND d.disease_name = 'Food Poisoning'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'constipation'
  AND d.disease_name = 'IBS'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'palpitations'
  AND d.disease_name = 'Hypertension'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'palpitations'
  AND d.disease_name = 'Hypotension'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'palpitations'
  AND d.disease_name = 'Heart Failure'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'high blood pressure'
  AND d.disease_name = 'Hypertension'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'high blood pressure'
  AND d.disease_name = 'Hypotension'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'high blood pressure'
  AND d.disease_name = 'Heart Failure'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'low blood pressure'
  AND d.disease_name = 'Hypertension'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'low blood pressure'
  AND d.disease_name = 'Hypotension'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'low blood pressure'
  AND d.disease_name = 'Heart Failure'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'frequent urination'
  AND d.disease_name = 'UTI'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'frequent urination'
  AND d.disease_name = 'Kidney Stones'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'painful urination'
  AND d.disease_name = 'UTI'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'painful urination'
  AND d.disease_name = 'Kidney Stones'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'blood in urine'
  AND d.disease_name = 'UTI'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'blood in urine'
  AND d.disease_name = 'Kidney Stones'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'blurred vision'
  AND d.disease_name = 'Migraine'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'blurred vision'
  AND d.disease_name = 'Epilepsy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'eye pain'
  AND d.disease_name = 'Migraine'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'eye pain'
  AND d.disease_name = 'Epilepsy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'ear pain'
  AND d.disease_name = 'Migraine'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'ear pain'
  AND d.disease_name = 'Epilepsy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'chills'
  AND d.disease_name = 'Influenza'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'chills'
  AND d.disease_name = 'Dengue'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'chills'
  AND d.disease_name = 'Viral Fever'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'chills'
  AND d.disease_name = 'Typhoid'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'chills'
  AND d.disease_name = 'COVID-19'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'tremors'
  AND d.disease_name = 'Migraine'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'tremors'
  AND d.disease_name = 'Epilepsy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'seizures'
  AND d.disease_name = 'Migraine'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'seizures'
  AND d.disease_name = 'Epilepsy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'burning sensation'
  AND d.disease_name = 'Skin Allergy'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);
INSERT IGNORE INTO symptom_diseases (symptom_id, disease_id)
SELECT s.id, d.id
FROM symptom s,
     disease d
WHERE s.symptom = 'burning sensation'
  AND d.disease_name = 'Psoriasis'
  AND NOT EXISTS(SELECT 1 FROM symptom_diseases sd WHERE sd.symptom_id = s.id AND sd.disease_id = d.id);