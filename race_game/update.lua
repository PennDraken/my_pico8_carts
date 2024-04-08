function _update()
    car:update()
    camera:target(car.x + cos(car.angle) * 30, car.y + sin(car.angle) * 30, 1-(car.angle-0.25)%1)
end