USE pet_adoption;

SELECT p.name AS pet_name, p.species, a.first_name AS adopter_first_name, ad.adoption_date
FROM pet p
INNER JOIN adoption ad ON p.pet_id = ad.pet_id
INNER JOIN adopter a ON ad.adopter_id = a.adopter_id;

SELECT p.name AS pet_name, p.species, ad.adoption_date, a.first_name AS adopter_first_name
FROM pet p
LEFT JOIN adoption ad ON p.pet_id = ad.pet_id
LEFT JOIN adopter a ON ad.adopter_id = a.adopter_id;

SELECT a.first_name, a.last_name, p.name AS pet_name, ad.adoption_date
FROM adoption ad
RIGHT JOIN adopter a ON ad.adopter_id = a.adopter_id
LEFT JOIN pet p ON ad.pet_id = p.pet_id;


SELECT s.name AS shelter_name, p.name AS pet_name, p.species
FROM shelter s
LEFT JOIN pet p ON s.shelter_id = p.shelter_id
UNION
SELECT s.name AS shelter_name, p.name AS pet_name, p.species
FROM shelter s
RIGHT JOIN pet p ON s.shelter_id = p.shelter_id
WHERE s.shelter_id IS NULL;

SELECT s.name AS shelter_name, p.name AS pet_name, a.first_name, ad.adoption_date
FROM shelter s
INNER JOIN pet p ON s.shelter_id = p.shelter_id
INNER JOIN adoption ad ON p.pet_id = ad.pet_id
INNER JOIN adopter a ON ad.adopter_id = a.adopter_id;


SELECT a.first_name, a.last_name, COUNT(ad.adoption_id) AS adoption_count
FROM adopter a
LEFT JOIN adoption ad ON a.adopter_id = ad.adopter_id
GROUP BY a.adopter_id, a.first_name, a.last_name;