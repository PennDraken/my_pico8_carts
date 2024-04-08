function _update()
    car:update()
    camera:target(car.x, car.y, car.angle-0.25)
end