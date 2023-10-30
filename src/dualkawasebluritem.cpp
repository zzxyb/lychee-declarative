#include "dualkawasebluritem.h"
#include "dualkawasebluritem_p.h"

DualKawaseBlurItem::DualKawaseBlurItem(QQuickItem *parent)
    : QQuickItem(*(new DualKawaseBlurItemPrivate), parent)
{

}

DualKawaseBlurItem::DualKawaseBlurItem(DualKawaseBlurItemPrivate &dd, QQuickItem *parent)
    : QQuickItem(dd, parent)
{}
