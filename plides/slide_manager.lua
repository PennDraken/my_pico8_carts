function new_slide_manager()
    local manager = {}
    manager.slides = {}
    manager.slide_index = 1
    manager.add_slide = function(this, slide)
        add(this.slides, slide)
    end
    manager.add_slides = function(this, slides)
        for s in all(slides) do
            this:add_slide(s)
        end
    end
    manager.go_left = function(this)
        this.slide_index = max(1, this.slide_index - 1)
    end
    manager.go_right = function(this)
        this.slide_index = min(#this.slides, this.slide_index + 1)
    end
    manager.update = function(this)
        if (btnp(0)) this:go_left()
        if (btnp(1)) this:go_right()
    end
    manager.draw = function(this)
        this.slides[this.slide_index]:draw()
    end
    return manager
end