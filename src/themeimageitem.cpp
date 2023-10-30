#include "themeimageitem.h"
#include "themeimageitem_p.h"

ThemeImageItem::ThemeImageItem(QQuickItem *parent)
    : QQuickItem(*(new ThemeImageItemPrivate), parent)
{

}

ThemeImageItem::ThemeImageItem(ThemeImageItemPrivate &dd, QQuickItem *parent)
    : QQuickItem(dd, parent)
{}
