#ifndef DUALKAWASEBLURITEM_H
#define DUALKAWASEBLURITEM_H

#include "declarativeglobal.h"

#include <QQuickItem>

class DualKawaseBlurItemPrivate;

/**
 * @brief The DualKawaseBlurItem class Blur control, using DualKawaseBlur algorithm based on
 * source template for special effects post-processing,the special effect result is displayed
 * by item.
 */
class LYCHEE_DECLARATIVE_EXPORT DualKawaseBlurItem : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit DualKawaseBlurItem(QQuickItem *parent=nullptr);

protected:
    DualKawaseBlurItem(DualKawaseBlurItemPrivate &dd, QQuickItem *parent);

private:
    Q_DECLARE_PRIVATE(DualKawaseBlurItem)
    Q_DISABLE_COPY(DualKawaseBlurItem)
};

#endif // DUALKAWASEBLURITEM_H
