// Release surface and buffer memory.
buffer_delete(settled_buffer);
if (surface_exists(settled_surface))
    surface_free(settled_surface);
settled_surface = -1;