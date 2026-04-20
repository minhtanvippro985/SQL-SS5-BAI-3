
CREATE DATABASE delivery_system;
USE delivery_system;

-- 2. Tạo bảng Drivers
CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_name VARCHAR(100) NOT NULL,
    statusd VARCHAR(20) NOT NULL, 
    trust_score INT ,             
    distance_km DECIMAL(5, 2),  
    last_active DATETIME
);

INSERT INTO Drivers (driver_name, statusd, trust_score, distance_km, last_active) VALUES
('Nguyễn Văn A', 'AVAILABLE', 95, 1.2, NOW()),  
('Trần Thị B', 'AVAILABLE', 85, 1.5, NOW()),    
('Lê Văn C', 'AVAILABLE', 92, 1.5, NOW()),      
('Phạm Văn D', 'BUSY', 99, 0.5, NOW()),         
('Hoàng Văn E', 'LOCKED', 100, 0.8, NOW()),     
('Ngô Thị F', 'AVAILABLE', 75, 0.4, NOW()),     
('Đặng Văn G', 'AVAILABLE', 82, 3.0, NOW()),  
('ĐNN ASDASD ', 'AVAILABLE', -10, 3.0, NOW()),    
('Bùi Văn H', 'AVAILABLE', 80, 1.5, NOW());     


SELECT 
    driver_name, 
    statusd, 
    distance_km,
    CASE
        WHEN (trust_score < 0 OR trust_score = NULL)  THEN 0 AND statusd = 'LOCKED'
        ELSE trust_score
    END AS cleaned_trust_score
FROM Drivers
WHERE trust_score >= 80 AND (statusd = 'AVAILABLE') 
ORDER BY distance_km ASC , trust_score DESC


-- khi nhập -10 , trust_score đã có case để reset về 0 và đổi về locked sẽ không hiến thị
-- đầu vào data trong bảng - nếu trust_score <80 thì loại , 'busy' , 'locked' 
-- nếu gần -> sắp xếp lên hàng , gần nhưng mà trust_score bé hơn thì xếp xuống 


