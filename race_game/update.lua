function _update()
    car:update()
    --camera:target(car.x + cos(car.angle) * 30, car.y + sin(car.angle) * 30, 1-(car.angle-0.25)%1)
    camera:target(car.x + car.dx * 30, car.y + car.dy * 30, 1-(car.angle-0.25)%1)
end