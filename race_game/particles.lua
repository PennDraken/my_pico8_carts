function fire(x, y, dx, dy)
    p=particle(x, y, dx, dy, {1,2,3,4,5})
    p.f=0.96
    add(particles, p)
end

function smoke(x, y, dx, dy)
    p=particle(x, y, dx, dy, {17,18,19,20,21,22,23,24,25,26})
    p.f=0.96
    local t = 30
    p.lifetime = rnd(1)*t/2+t/2
    p.smoke_index = 8
    add(particles, p)
end

function particle(x, y, dx, dy, ns)
    local offs = 1
    local p = {
        x=x,
        y=y,
        f=0.8,
        dx=dx + rnd(offs) - offs/2,
        dy=dy + rnd(offs) - offs/2,
        ns=ns,
        smoke_index=nil,
        t=0,
        lifetime=rnd(1)*15+15,
        update=function(this)
            this.x += this.dx
            this.y += this.dy
            local f = this.f
            this.dx *= f
            this.dy *= f
            this.t += 1
            if this.t > this.lifetime then
                del(particles, this)
                del(particles_top, this)
            end
        end,
        draw=function(this)
            local i = flr( (this.t / this.lifetime) * #this.ns ) + 1
            if this.smoke_index and i > this.smoke_index then
                del(particles, this)
                add(particles_top, this)
                this.smoke_index = nil
            end
            local curr_n = this.ns[i]
            local x, y = rotatePoint(this.x - camera.x, this.y - camera.y, 64, 64, camera.angle)
            -- ?x,y
            -- stop()
            spr(curr_n, x - 4, y - 4)
        end
    }
    return p
end

