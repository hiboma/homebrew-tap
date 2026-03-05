from PIL import Image, ImageDraw, ImageFilter

# Load original avatar
avatar = Image.open('assets/original_avatar.png').convert('RGBA')
w, h = avatar.size

# Create overlay for the beer mug badge
overlay = Image.new('RGBA', (w, h), (0, 0, 0, 0))
draw = ImageDraw.Draw(overlay)

# Badge position: bottom-right corner
badge_size = int(w * 0.38)
margin = int(w * 0.02)
bx = w - badge_size - margin
by = h - badge_size - margin

cx, cy = bx + badge_size // 2, by + badge_size // 2
r = badge_size // 2
draw.ellipse([cx - r, cy - r, cx + r, cy + r], fill=(44, 62, 80, 230), outline=(255, 255, 255, 255), width=3)

# Mug body
mug_left = cx - int(r * 0.45)
mug_right = cx + int(r * 0.25)
mug_top = cy - int(r * 0.45)
mug_bottom = cy + int(r * 0.45)
draw.rounded_rectangle([mug_left, mug_top, mug_right, mug_bottom], radius=4, fill=(251, 191, 36, 255), outline=(255, 255, 255, 255), width=2)

# Mug handle
handle_left = mug_right
handle_right = cx + int(r * 0.55)
handle_top = cy - int(r * 0.2)
handle_bottom = cy + int(r * 0.25)
draw.arc([handle_left, handle_top, handle_right, handle_bottom], start=-90, end=90, fill=(255, 255, 255, 255), width=3)

# Beer foam
foam_top = mug_top - int(r * 0.15)
foam_bottom = mug_top + int(r * 0.1)
draw.rounded_rectangle([mug_left - 3, foam_top, mug_right + 3, foam_bottom], radius=6, fill=(255, 255, 255, 240))

# Foam bubbles
for dx, dy, dr in [(-int(r * 0.2), foam_top - 4, 6), (0, foam_top - 6, 7), (int(r * 0.15), foam_top - 3, 5)]:
    draw.ellipse([cx + dx - dr - int(r * 0.1), dy - dr, cx + dx + dr - int(r * 0.1), dy + dr], fill=(255, 255, 255, 220))

# Apply light Gaussian blur to soften edges
overlay = overlay.filter(ImageFilter.GaussianBlur(radius=1.2))

# Composite
result = Image.alpha_composite(avatar, overlay)
result = result.convert('RGB')
result.save('assets/tap_icon.png', 'PNG')
print('Generated assets/tap_icon.png')
